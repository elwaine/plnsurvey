import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? userImage;

  @override
  void initState() {
    super.initState();
    // Simulate fetching data from a database
    _nameController.text = "Aurelia Eka Salsabila"; // User's name
    _nipController.text = "50394224"; // User's NIP
    _roleController.text = "Penyelenggara"; // User's role
    _passwordController.text = "092u32839"; // User's role
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xff118A9F),
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
          onPressed: () => Navigator.pop(context, '/dashboard'),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground, // Replace with your gradient
            ),
          ),

          // Your content
          SafeArea(
            child: Stack(
              children: [
                // Top decorative circle
                Positioned(
                  top: 30,
                  left: 170,
                  child: Image.asset(
                    'assets/decor_profile.png',
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.75,
                    fit: BoxFit.contain,
                  ),
                ),

                // Bottom decorative circle
                Positioned(
                  bottom: -20,
                  left: -19,
                  child: Image.asset(
                    'assets/decor_login.png',
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),

                // White container (Form and Content)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: screenWidth * 0.85,
                      height: screenHeight * 0.56,
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
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
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
                                  ],
                                ),
                                const SizedBox(height: 10.0),

                                // NIP Field (non-editable)
                                _buildNonEditableField(
                                  title: 'NIP',
                                  value: _nipController.text,
                                ),
                                const SizedBox(height: 10.0),

                                _buildNonEditableField(
                                  title: 'Peran',
                                  value: _roleController.text,
                                ),
                                const SizedBox(height: 10.0),
                                _buildNonEditableField(
                                  title: 'Password',
                                  value: _passwordController.text,
                                ),

                                CustomButton(
                                  title: 'Keluar',
                                  onPressed: () {
                                    print("Logged out");
                                    Navigator.pushNamed(context, '/login-form');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/editpfp');
                              },
                              child: Image.asset(
                                'assets/logoedit.png',
                                height: screenHeight * 0.05,
                                width: screenWidth * 0.1,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: screenHeight * 0.09,
                  left: (screenWidth - 130) / 2,
                  child: CircleAvatar(
                    radius: 66,
                    backgroundColor: const Color.fromARGB(255, 197, 196, 196),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -4,
                          left: -14,
                          child: SizedBox(
                            width: 168,
                            height: 140,
                            child: Image.asset(
                              userImage ?? "assets/pfp_placeholder.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
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
            border: Border.all(color: Color(0xff14A2B8), width: 1.4),
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
