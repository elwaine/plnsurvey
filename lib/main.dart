import 'package:flutter/material.dart';
import 'package:plnsurvey/ui/pages/dashboard.dart';
import 'package:plnsurvey/ui/pages/login.dart';
import 'package:plnsurvey/ui/pages/notif.dart';
import 'package:plnsurvey/ui/pages/report_survey.dart';
import 'package:plnsurvey/ui/pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login-form': (context) => Login(),
      },
    );
  }
}
