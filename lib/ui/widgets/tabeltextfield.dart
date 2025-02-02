import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class TabelTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller; // Added controller

  const TabelTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    this.controller, // Controller parameter
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
            controller: controller, // Integrated controller
            cursorColor: kBlackColor,
            obscureText: obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF2F8F9),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
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
