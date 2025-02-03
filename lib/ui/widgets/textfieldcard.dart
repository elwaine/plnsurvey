import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class Textfieldcard extends StatefulWidget {
  final String title;
  final String hintText;
  final Widget? child;

  const Textfieldcard({
    Key? key,
    required this.title,
    required this.hintText,
    this.child,
  }) : super(key: key);

  @override
  _TextfieldcardState createState() => _TextfieldcardState();
}

class _TextfieldcardState extends State<Textfieldcard> {
  String? _selectedOption;

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
          // 📝 Title
          Text(
            widget.title,
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: black,
            ),
          ),

          // 📝 Render child if it's not null
          if (widget.child != null) ...[
            const SizedBox(height: 8),
            widget.child!,
            const SizedBox(height: 12),
          ],

          TextFormField(
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F8F9),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
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
