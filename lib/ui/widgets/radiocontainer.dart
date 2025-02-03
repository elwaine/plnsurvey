import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomRadioContainer extends StatefulWidget {
  final String title;
  final String hintText;
  final List<String> options;
  final String? choice;
  final String? extraOptionLabel;
  final ValueChanged<String?>? onChanged;
  final Widget? child; // ✅ Ensure child is included

  const CustomRadioContainer({
    Key? key,
    required this.title,
    required this.hintText,
    required this.options,
    this.choice,
    this.extraOptionLabel,
    this.onChanged,
    this.child,
  }) : super(key: key);

  @override
  _CustomRadioContainerState createState() => _CustomRadioContainerState();
}

class _CustomRadioContainerState extends State<CustomRadioContainer> {
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
            const SizedBox(height: 8), // Add spacing
            widget.child!,
            const SizedBox(height: 12),
          ],

          // 📝 Radio Buttons
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

          // 📝 Extra Option (If any)
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

          // 📝 Extra Input Field for "Lainnya"
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

  Widget _buildRadioOption(BuildContext context,
      {required String title,
      required String value,
      required double screenHeight}) {
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
            // 📝 Custom Circle Button
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _selectedOption == value
                      ? kPrimaryColor // Primary color when selected
                      : Colors.black38, // Gray when unselected
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
