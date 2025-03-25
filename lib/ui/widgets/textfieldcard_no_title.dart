import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class TextfieldcardNoTitle extends StatefulWidget {
  final String hintText;
  final Widget? child;

  const TextfieldcardNoTitle({
    Key? key,
    required this.hintText,
    this.child,
  }) : super(key: key);

  @override
  _TextfieldcardNoTitleState createState() => _TextfieldcardNoTitleState();
}

class _TextfieldcardNoTitleState extends State<TextfieldcardNoTitle> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
