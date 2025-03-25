import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomRadioButtonns extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final String? choice;
  final String? extraOptionLabel;
  final ValueChanged<String?>? onChanged;

  const CustomRadioButtonns({
    Key? key,
    required this.hintText,
    required this.options,
    this.choice,
    this.extraOptionLabel,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioButtonnsState createState() => _CustomRadioButtonnsState();
}

class _CustomRadioButtonnsState extends State<CustomRadioButtonns> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.choice;
  }

  void _handleSelection(String? value) {
    setState(() {
      _selectedOption = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.options.map(
          (option) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildRadioOption(
              context,
              title: option,
              value: option,
              screenHeight: screenHeight,
            ),
          ),
        ),
        if (widget.extraOptionLabel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildRadioOption(
              context,
              title: widget.extraOptionLabel!,
              value: "Input Lainnya",
              screenHeight: screenHeight,
            ),
          ),
        if (_selectedOption == "Input Lainnya")
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
              hintStyle: darkblueTextStyle.copyWith(fontSize: 14),
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

  Widget _buildRadioOption(BuildContext context,
      {required String title,
      required String value,
      required double screenHeight}) {
    return GestureDetector(
      onTap: () => _handleSelection(value), // Make the entire option clickable
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF2F8F9), // Consistent background for all
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Circle Button
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedOption == value
                      ? kPrimaryColor
                      : kSurveyFontColor,
                  width: 2,
                ),
              ),
              child: _selectedOption == value
                  ? Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 1.8,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                        width: 3.0,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kSurveyFontColor,
                            width: 12.0, // Adjusted line weight
                          ),
                        ),
                      ),
                    ),
            ),
            const SizedBox(width: 12), // Spacing between the circle and text
            // Option Text
            Expanded(
              child: Text(
                title,
                style: darkblueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _selectedOption == value
                      ? kPrimaryColor // Text changes to primary color
                      : kSurveyFontColor, // Default black for unselected
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
