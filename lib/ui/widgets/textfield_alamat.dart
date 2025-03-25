import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'map_picker_screen.dart';

class MapAddressPicker extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool isDisabled;

  const MapAddressPicker({
    Key? key,
    required this.title,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _MapAddressPickerState createState() => _MapAddressPickerState();
}

class _MapAddressPickerState extends State<MapAddressPicker> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  Future<void> _openMapPicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPickerScreen()),
    );

    if (result != null && result["address"] != null) {
      setState(() {
        _controller.text = result["address"];
      });
      widget.onChanged?.call(result["address"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: darkblueTextStyle.copyWith(
              fontSize: 15,
              fontWeight: black,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              // Address Input Field
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF2F8F9),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 12,
                    ),
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(fontSize: 14),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // "Pilih dari Peta" Button
              GestureDetector(
                onTap: widget.isDisabled ? null : _openMapPicker,
                child: Text(
                  "pilih dari peta",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
