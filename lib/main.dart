import 'package:flutter/material.dart';
import 'package:plnsurvey/ui/pages/dashboard.dart';
import 'package:plnsurvey/ui/pages/editpfp.dart';
import 'package:plnsurvey/ui/pages/surveyA.dart';
import 'package:plnsurvey/ui/pages/login.dart';
import 'package:plnsurvey/ui/pages/notif.dart';
import 'package:plnsurvey/ui/pages/profile.dart';
import 'package:plnsurvey/ui/pages/report_survey.dart';
import 'package:plnsurvey/ui/pages/splash_screen.dart';
import 'package:plnsurvey/ui/pages/surveyB.dart';
import 'package:plnsurvey/ui/pages/surveyD.dart';

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
        '/dashboard': (context) => Dashboard(),
        '/profile': (context) => Profile(),
        '/editpfp': (context) => Editpfp(),
        '/surveyb': (context) => SurveyB(),
        '/surveyd': (context) => SurveyD(),
        '/surveya': (context) => SurveyPage(),
      },
    );
  }
}
