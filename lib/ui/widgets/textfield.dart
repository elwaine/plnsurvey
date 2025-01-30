import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SurveyTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;

  const SurveyTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: black,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F8F9),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.transparent, // Invisible border
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
