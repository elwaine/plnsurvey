import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 30, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: blueTextStyle.copyWith(
            fontWeight: semibold,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          cursorColor: kBlackColor,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              borderSide: BorderSide(
                color: kLoginFontColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              borderSide: BorderSide(
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
