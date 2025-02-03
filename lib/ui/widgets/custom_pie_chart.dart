import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomPieChartCard extends StatelessWidget {
  final String title;
  final Map<String, double> data;
  final Map<String, Color> colors;

  const CustomPieChartCard({
    Key? key,
    required this.title,
    required this.data,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mostAnswerText =
        data.entries.reduce((a, b) => a.value > b.value ? a : b).key;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Text(
            title,
            style: darkblueTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Pie Chart Section
                Center(
                  child: SizedBox(
                    height: 130,
                    child: PieChart(
                      PieChartData(
                        sections: data.entries.map((entry) {
                          return PieChartSectionData(
                            value: entry.value,
                            color: colors[entry.key] ?? Colors.grey,
                            title: '',
                            radius: 75,
                          );
                        }).toList(),
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Legend Section (Vertical List)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.keys.map((label) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child:
                          _buildLegendItem(colors[label] ?? Colors.grey, label),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Most Answered Section (Auto-generated)
          Text(
            'Jawaban Terbanyak:',
            style: darkblueTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xffF2F8F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              mostAnswerText, // Now automatically selected
              style: darkblueTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style:
                darkblueTextStyle.copyWith(fontSize: 12, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
