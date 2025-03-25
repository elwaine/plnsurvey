import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomCheckboxz extends StatefulWidget {
  final List<String> options;
  final String? extraOptionLabel;
  final ValueChanged<List<String>>? onChanged;

  const CustomCheckboxz({
    Key? key,
    required this.options,
    this.extraOptionLabel,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxzState createState() => _CustomCheckboxzState();
}

class _CustomCheckboxzState extends State<CustomCheckboxz> {
  List<String> _selectedOptions = [];
  String? _extraOptionValue;

  void _handleSelection(String value, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedOptions.add(value);
      } else {
        _selectedOptions.remove(value);
      }
    });
    widget.onChanged?.call(_selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Default Checkbox Options
        ...widget.options.map(
          (option) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildCheckboxOption(option, option),
          ),
        ),

        // Extra Option
        if (widget.extraOptionLabel != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child:
                _buildCheckboxOption(widget.extraOptionLabel!, "Input Lainnya"),
          ),

        // Input Field when "Input Lainnya" is checked
        if (_selectedOptions.contains("Input Lainnya"))
          TextFormField(
            cursorColor: kBlackColor,
            onChanged: (value) {
              setState(() {
                _extraOptionValue = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F8F9),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 12,
              ),
              hintText: "-",
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

  Widget _buildCheckboxOption(String title, String value) {
    final isSelected = _selectedOptions.contains(value);

    return GestureDetector(
      onTap: () => _handleSelection(value, !isSelected),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF2F8F9),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Custom Filled Checkbox
            Container(
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: isSelected
                    ? kPrimaryColor
                    : Colors.grey[400], // Filled only
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(width: 12),
            // Option Text
            Expanded(
              child: Text(
                title,
                style: darkblueTextStyle.copyWith(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? kPrimaryColor : kSurveyFontColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
