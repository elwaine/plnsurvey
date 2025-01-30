import 'package:flutter/material.dart';
import 'dart:async';
import '../../shared/theme.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2,
      size.width,
      size.height * 0.75,
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
      // Navigator.pushNamed(context, '/login-form');
      Navigator.pushNamed(context, '/surveya');
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
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground,
            ),
          ),

          Positioned(
            top: screenHeight * 0.6,
            left: screenWidth * 0.08,
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Image.asset(
                'assets/tianglistrik.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(
              color: Colors.white,
              height: screenHeight * 0.44,
              width: double.infinity,
            ),
          ),

          Positioned(
            top: screenHeight * 0.48,
            left: screenWidth * 0.055,
            child: SizedBox(
              width: screenWidth * 0.5,
              height: screenHeight * 0.08,
              child: Image.asset(
                'assets/quotesplash.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.07,
            child: SizedBox(
              width: screenWidth * 0.9,
              child: Image.asset(
                'assets/logoplnsurvey.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
