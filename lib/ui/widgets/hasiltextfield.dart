import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HasilTextContainer extends StatelessWidget {
  final String title;
  final List<String> texts;

  const HasilTextContainer({
    Key? key,
    required this.title,
    required this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
          Text(
            title,
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: texts.map((text) => _buildTextContainer(text)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContainer(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF2F8F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
      child: Text(
        text,
        style: darkblueTextStyle.copyWith(fontSize: 12, fontWeight: semibold),
      ),
    );
  }
}
