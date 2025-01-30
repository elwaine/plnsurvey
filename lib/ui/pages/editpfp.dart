import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_button.dart';

class Editpfp extends StatefulWidget {
  @override
  _EditpfpState createState() => _EditpfpState();
}

class _EditpfpState extends State<Editpfp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = "Aurelia Eka Salsabila";
    _nipController.text = "50394224";
    _roleController.text = "Penyelenggara";
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context, '/dashboard'),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground,
            ),
          ),

          SafeArea(
            child: Stack(
              children: [
                // Top decorative circle
                Positioned(
                  top: -20,
                  left: 0,
                  child: Image.asset(
                    'assets/circleataslogin.png',
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),

                // Bottom decorative circle
                Positioned(
                  bottom: -20,
                  right: -19,
                  child: Image.asset(
                    'assets/circlebawahlogin.png',
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),

                // White container
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.52,
                      margin: EdgeInsets.only(top: screenHeight * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 50),
                                    Text(
                                      _nameController.text,
                                      style: blueTextStyle.copyWith(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 23,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      _roleController.text,
                                      style: greyTextStyle.copyWith(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                            const SizedBox(height: 20.0),

                            // NIP Field (non-editable)
                            _buildNonEditableField(
                              title: 'NIP',
                              value: _nipController.text,
                            ),
                            const SizedBox(height: 10.0),

                            // Role Field (non-editable)
                            _buildNonEditableField(
                              title: 'Peran',
                              value: _roleController.text,
                            ),

                            // Logout Button
                            CustomButton(
                              title: 'Simpan',
                              onPressed: () {
                                print("Logged out");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Circle Avatar
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.012, left: screenWidth * 0.32),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.17,
                        backgroundColor:
                            const Color.fromARGB(255, 197, 196, 196),
                        backgroundImage:
                            AssetImage("assets/pfp_placeholder.png"),
                      ),
                      Container(
                        width: screenWidth * 0.34,
                        height: screenHeight * 0.34,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon
                            Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(height: 10),
                            // Text
                            Text(
                              'Ubah Foto',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNonEditableField({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blueTextStyle.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.teal, width: 1.7),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            value,
            style: greyTextStyle.copyWith(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
