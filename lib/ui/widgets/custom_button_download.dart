import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DownloadButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const DownloadButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.055,
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff24D7FF),
            Color(0xff84FBF0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Keeps content centered
            children: [
              Icon(
                Icons.insert_drive_file, // CSV file icon
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8), // Space between icon & text
              Text(
                title,
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
