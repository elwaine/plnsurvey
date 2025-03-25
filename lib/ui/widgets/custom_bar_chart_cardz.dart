import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomBarChartCardz extends StatelessWidget {
  final String title;
  final Map<String, double> data;
  final Map<String, Color> colors;

  const CustomBarChartCardz({
    Key? key,
    required this.title,
    required this.data,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          // Category Chip
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2.7, horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1FA8B3), width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Ekonomi',
              style: TextStyle(
                color: Color(0xFF1FA8B3),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(14.0),
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
            child: Column(children: [
              // Bar Chart Section
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    barGroups: _buildBarGroups(),
                    titlesData: _buildTitles(),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      checkToShowHorizontalLine: (value) => true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.black.withOpacity(0.2),
                          strokeWidth: 0.5,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              // Explanation Section (Legend)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data.keys.map((key) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 9.0),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: colors[key] ?? Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            key,
                            style: darkblueTextStyle.copyWith(
                                fontSize: 11, fontWeight: bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Helper to build bar groups
  List<BarChartGroupData> _buildBarGroups() {
    return data.entries.map((entry) {
      return BarChartGroupData(
        x: data.keys.toList().indexOf(entry.key),
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: colors[entry.key] ?? Colors.black,
            width: 55,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  // Helper to build titles for x-axis
  FlTitlesData _buildTitles() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, _) {
              final keysList = data.keys.toList();
              if (value.toInt() >= keysList.length) return const SizedBox();
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
              );
            }),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }
}
