import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class SurveyNoteCard extends StatelessWidget {
  final String title;
  final String topContent; // Top note
  final String bottomHintText; // Hint text for the TextFormField
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  const SurveyNoteCard({
    Key? key,
    required this.title,
    required this.topContent,
    required this.bottomHintText,
    this.backgroundColor = Colors.white,
    this.titleStyle,
    this.contentStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title (Plain Text, no container)
          Text(
            title,
            style: titleStyle ??
                darkblueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Text(
              topContent,
              style: contentStyle ??
                  darkblueTextStyle.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 12),

          // Bottom TextField (Rounded borderless container style)
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: const Color(0xffF2F8F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: bottomHintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
