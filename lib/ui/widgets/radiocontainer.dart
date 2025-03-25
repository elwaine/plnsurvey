import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomRadioContainer extends StatefulWidget {
  final String title;
  final String hintText;
  final List<String> options;
  final String? selectedValue;
  final String? extraOptionLabel;
  final ValueChanged<String?>? onChanged;
  final Widget? child;
  final bool isDisabled;

  const CustomRadioContainer({
    Key? key,
    required this.title,
    required this.hintText,
    required this.options,
    this.selectedValue,
    this.extraOptionLabel,
    this.onChanged,
    this.child,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _CustomRadioContainerState createState() => _CustomRadioContainerState();
}

class _CustomRadioContainerState extends State<CustomRadioContainer> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  void _handleSelection(String? value) {
    if (widget.isDisabled) return;
    setState(() {
      _selectedValue = value;
    });
    widget.onChanged?.call(value);
  }

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
          if (widget.child != null) ...[
            const SizedBox(height: 8),
            widget.child!,
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 16),
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
          if (_selectedValue == "Input Lainnya")
            TextFormField(
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffF2F8F9),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 12,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(fontSize: 14),
                enabled: !widget.isDisabled,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: kPrimaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(BuildContext context,
      {required String title,
      required String value,
      required double screenHeight}) {
    return GestureDetector(
      onTap: widget.isDisabled ? null : () => _handleSelection(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF2F8F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedValue == value
                      ? kPrimaryColor
                      : kSurveyFontColor,
                  width: 2,
                ),
              ),
              child: _selectedValue == value
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
                            width: 12.0,
                          ),
                        ),
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: darkblueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _selectedValue == value
                      ? kPrimaryColor
                      : kSurveyFontColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
