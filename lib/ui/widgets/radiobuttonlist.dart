import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final String hintText;
  final String choice;
  final bool obscureText;

  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.hintText,
    required this.choice,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String? jenisBantuan;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
          Text(
            widget.title,
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: black,
            ),
          ),
          const SizedBox(height: 16),
          // Bantuan Fisik option
          Container(
            height: screenHeight * 0.056,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: jenisBantuan == "Bantuan Fisik"
                  ? kPrimaryColor.withOpacity(0.1)
                  : const Color(0xffF2F8F9),
            ),
            child: RadioListTile<String>(
              title: Text(
                "Bantuan Fisik",
                style: darkblueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: jenisBantuan == "Bantuan Fisik"
                      ? kPrimaryColor
                      : Colors.black,
                ),
              ),
              activeColor: kPrimaryColor,
              value: "Bantuan Fisik",
              groupValue: jenisBantuan,
              onChanged: (value) {
                setState(() {
                  jenisBantuan = value;
                });
              },
            ),
          ),
          const SizedBox(height: 12),
          // Bantuan Non Fisik option
          Container(
            height: screenHeight * 0.056,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: jenisBantuan == "Bantuan Non Fisik"
                  ? kPrimaryColor.withOpacity(0.1)
                  : const Color(0xffF2F8F9),
            ),
            child: RadioListTile<String>(
              title: Text(
                "Bantuan Non Fisik",
                style: blueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: jenisBantuan == "Bantuan Non Fisik"
                      ? kPrimaryColor
                      : Colors.black,
                ),
              ),
              activeColor: kPrimaryColor,
              value: "Bantuan Non Fisik",
              groupValue: jenisBantuan,
              onChanged: (value) {
                setState(() {
                  jenisBantuan = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
