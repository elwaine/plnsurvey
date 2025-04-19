import 'package:flutter/material.dart';
import 'dart:async';
import '../../shared/theme.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.0,
      size.width,
      size.height * 0.72,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/login-form');

      //     // Navigator.pushNamed(context, '/dashboard');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground,
            ),
          ),
          Positioned(
            top: screenHeight * 0.57,
            left: screenWidth * 0.3,
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Image.asset(
                'assets/tianglistrik_v2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(
              color: Colors.white,
              height: screenHeight * 0.5,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.15,
            child: SizedBox(
              width: screenWidth * 0.85,
              height: screenHeight * 0.135,
              child: Image.asset(
                'assets/quotesplash2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: screenWidth * 0.03,
            child: SizedBox(
              width: screenWidth * 0.97,
              child: Image.asset(
                'assets/plnsurvey_newlogo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.02,
            left: screenWidth * 0.72,
            child: SizedBox(
              width: screenWidth * 0.24,
              child: Image.asset(
                'assets/logo_plnpeduli.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.68,
            right: screenWidth * 0.4,
            child: SizedBox(
              width: screenWidth * 0.6,
              child: Image.asset(
                'assets/bungapln1.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
