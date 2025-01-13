import 'package:flutter/material.dart';
import 'package:plnsurvey/shared/theme.dart';
import 'package:plnsurvey/ui/widgets/custom_button.dart';
import 'package:plnsurvey/ui/widgets/custom_text_form_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Widgets for input fields and button
    Widget submitButton() {
      return CustomButton(
        title: 'Masuk',
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
        },
      );
    }

    Widget nipInput() {
      return CustomTextFormField(
        title: 'NIP',
        hintText: 'Masukkan NIP Anda',
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        title: 'Kata Sandi',
        hintText: 'Masukkan Kata Sandi',
        obscureText: true,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: kPrimaryBackground,
              ),
            ),

            // Circle atas
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

            // Circle bawah
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

            // White container (Form and Content)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.57,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Logo
                      Positioned(
                        left: screenWidth * 0.02,
                        child: Image.asset(
                          'assets/logologin.png',
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.26,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Quote/Header Section
                      Positioned(
                        top: screenHeight * 0.09,
                        left: screenWidth * 0.05,
                        child: Image.asset(
                          'assets/quotelogin.png',
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.5,
                          fit: BoxFit.contain,
                        ),
                      ),

                      Positioned(
                        top: screenHeight * 0.18,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.8,
                          height: 2.0,
                          color: kPrimaryColor,
                        ),
                      ),

                      // Input Fields and Button
                      Positioned(
                        top: screenHeight * 0.2,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            nipInput(),
                            const SizedBox(height: 10.0),
                            passwordInput(),
                            submitButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
