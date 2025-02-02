import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomRowRadioButtonz extends StatefulWidget {
  final String title;
  final String hintText;
  final List<String> options;
  final String? choice;
  final ValueChanged<String?>? onChanged;

  const CustomRowRadioButtonz({
    Key? key,
    required this.title,
    required this.hintText,
    required this.options,
    this.choice,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomRowRadioButtonzState createState() => _CustomRowRadioButtonzState();
}

class _CustomRowRadioButtonzState extends State<CustomRowRadioButtonz> {
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
          // Title (Dynamic based on selection)
          Text(
            _getDynamicTitle(),
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: black,
            ),
          ),
          const SizedBox(height: 16),

          // Radio Button Options
          ...widget.options.map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: _buildRadioOption(
                context,
                title: option,
                value: option,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Conditional Text Field
          if (_selectedOption != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  _getDynamicFieldLabel(),
                  style: darkblueTextStyle.copyWith(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
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
        ],
      ),
    );
  }

  String _getDynamicTitle() {
    if (_selectedOption == "Layak") {
      return "${widget.title} (Layak)";
    } else if (_selectedOption == "Tidak Layak") {
      return "${widget.title} (Tidak Layak)";
    }
    return widget.title;
  }

  String _getDynamicFieldLabel() {
    if (_selectedOption == "Layak") {
      return "Alasan jika layak:";
    } else if (_selectedOption == "Tidak Layak") {
      return "Alasan jika tidak layak:";
    }
    return "";
  }

  Widget _buildRadioOption(
    BuildContext context, {
    required String title,
    required String value,
  }) {
    return GestureDetector(
      onTap: () => _handleSelection(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF2F8F9),
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
                  color:
                      _selectedOption == value ? kPrimaryColor : Colors.black38,
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
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  : null,
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
                  color:
                      _selectedOption == value ? kPrimaryColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
