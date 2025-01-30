import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';

class CustomCheckboxContainer extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<List<String>>? onChanged;

  const CustomCheckboxContainer({
    Key? key,
    required this.title,
    required this.options,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxContainerState createState() =>
      _CustomCheckboxContainerState();
}

class _CustomCheckboxContainerState extends State<CustomCheckboxContainer> {
  List<String> _selectedOptions = [];

  void _handleSelection(String value, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedOptions.add(value);
      } else {
        _selectedOptions.remove(value);
      }
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedOptions);
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
          Text(
            widget.title,
            style: darkblueTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: black,
            ),
          ),
          const SizedBox(height: 16),
          ...widget.options.map((option) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child:
                    _buildCheckboxOption(context, title: option, value: option),
              )),
        ],
      ),
    );
  }

  Widget _buildCheckboxOption(BuildContext context,
      {required String title, required String value}) {
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
            // Custom Checkbox
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? kPrimaryColor : Colors.black38,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(2),
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
                  color: isSelected ? kPrimaryColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
