import 'package:flutter/material.dart';
import 'dart:async';
import '../../shared/theme.dart';

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
          Container(
            decoration: BoxDecoration(
              gradient: kPrimaryBackground,
            ),
          ),
          Positioned(
            top: -MediaQuery.of(context).size.height * 0.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 300),
                ),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Image.asset('assets/logoplnsurvey.png',
                      fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                        width: 500,
                        height: 500,
                        'assets/tianglistrik.png',
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
