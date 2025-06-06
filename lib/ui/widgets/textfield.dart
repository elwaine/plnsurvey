import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SurveyTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final bool? enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged; // ✅ Add onChanged
  final bool? isDisabled; // ✅ Add isDisabled

  const SurveyTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.enabled,
    this.controller,
    this.onChanged, // ✅ Include onChanged
    this.isDisabled, // ✅ Include isDisabled
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
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            cursorColor: kBlackColor,
            obscureText: obscureText,
            enabled:
                isDisabled == true ? false : enabled, // ✅ Support isDisabled
            onChanged: onChanged, // ✅ Support onChanged
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF2F8F9),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              hintText: hintText,
              hintStyle: darkblueTextStyle.copyWith(fontSize: 13),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
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
