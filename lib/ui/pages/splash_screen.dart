import 'package:flutter/material.dart';
import 'dart:async';
import '../../shared/theme.dart';

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(
        0, size.height * 0.75); // Start at the middle-left of the widget.
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 1.2, // Control point for the downward curve.
      size.width,
      size.height * 0.75, // End at the middle-right of the widget.
    );
    path.lineTo(size.width, 0); // Line to top-right corner.
    path.lineTo(0, 0); // Line to top-left corner.
    path.close(); // Close the path.
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 510, left: 80),
            child: SizedBox(
              width: 400,
              child: Image.asset(
                'assets/tianglistrik.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 400),
          //     child: SizedBox(
          //       width: 550,
          //       height: 550,
          //       child: Image.asset(
          //         'assets/circlesplash.png',
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),

          ClipPath(
            clipper: HalfCircleClipper(),
            child: Container(
              color: Colors.white, // The color of the half-circle.
              height: 360, // Adjust the height to fit your design.
              width: double.infinity, // Full width of the screen.
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 400, left: 20, bottom: 300),
            child: SizedBox(
              width: 200,
              height: 65,
              child: Image.asset(
                'assets/quotesplash.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 470),
              child: SizedBox(
                width: 320,
                child: Image.asset(
                  'assets/logoplnsurvey.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
