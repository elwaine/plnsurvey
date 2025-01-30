import 'package:flutter/material.dart';

class RowRadioButtonz extends StatefulWidget {
  @override
  _RowRadioButtonzState createState() => _RowRadioButtonzState();
}

class _RowRadioButtonzState extends State<RowRadioButtonz> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
            mainAxisSize: MainAxisSize.min,
            children: [
              // Kesimpulan Header
              Text(
                "Kesimpulan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Radio Buttons
              _buildRadioOption("Layak"),
              _buildRadioOption("Tidak Layak"),
              const SizedBox(height: 16),

              // Conditional Display for Layak
              if (_selectedOption == "Layak")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rekomendasi Besaran Bantuan (jika layak):",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Rp. 500.000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

              // Conditional Display for Tidak Layak
              if (_selectedOption == "Tidak Layak")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      "Alasan tidak layak:",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF2F8F9),
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
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = title;
        });
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _selectedOption == title ? Colors.blue : Colors.black38,
                width: 2,
              ),
            ),
            child: _selectedOption == title
                ? Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _selectedOption == title ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
