import 'package:flutter/material.dart';
import 'package:plnsurvey/ui/pages/approve-a.dart';
import 'package:plnsurvey/ui/pages/approve-b.dart';
import 'package:plnsurvey/ui/pages/dashboard.dart';
import 'package:plnsurvey/ui/pages/dashboardapprover.dart';
import 'package:plnsurvey/ui/pages/editpfp.dart';
import 'package:plnsurvey/ui/pages/hasiil_SurveyE.dart';
import 'package:plnsurvey/ui/pages/hasil_SurveyA.dart';
import 'package:plnsurvey/ui/pages/hasil_SurveyB.dart';
import 'package:plnsurvey/ui/pages/hasil_SurveyC.dart';
import 'package:plnsurvey/ui/pages/hasil_SurveyD.dart';
import 'package:plnsurvey/ui/pages/listsurvey.dart';
import 'package:plnsurvey/ui/pages/surveyA.dart';
import 'package:plnsurvey/ui/pages/login.dart';
import 'package:plnsurvey/ui/pages/notif.dart';
import 'package:plnsurvey/ui/pages/profile.dart';
import 'package:plnsurvey/ui/pages/report_survey.dart';
import 'package:plnsurvey/ui/pages/splash_screen.dart';
import 'package:plnsurvey/ui/pages/surveyB.dart';
import 'package:plnsurvey/ui/pages/surveyC.dart';
import 'package:plnsurvey/ui/pages/surveyD.dart';
import 'package:plnsurvey/ui/pages/surveyE.dart';
import 'package:plnsurvey/ui/pages/surveyE_Approver.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SurveyPage(),
        // '/': (context) => SplashScreen(),
        '/login-form': (context) => Login(),
        '/dashboard': (context) => SurveyDashboard(),
        '/profile': (context) => Profile(),
        '/editpfp': (context) => Editpfp(),
        '/surveyb': (context) => SurveyB(),
        '/surveyc': (context) => SurveyC(),
        '/surveyd': (context) => SurveyD(),
        '/surveye': (context) => SurveyE(),
        '/surveye-approver': (context) => SurveyE_Approver(),
        // '/surveya': (context) => SurveyPage(),
        '/hasilsurveya': (context) => HasilSurveyA(),
        '/hasilsurveyb': (context) => HasilSurveyB(),
        '/hasilsurveyc': (context) => HasilSurveyC(),
        '/hasilsurveyd': (context) => HasilSurveyD(),
        '/hasilsurveye': (context) => HasilSurveyE(),
        '/notifpage': (context) => NotificationPage(),
        '/reportsurvey': (context) => ReportSurveyPage(),
        '/listsurvey': (context) => ListSurveyPage(),
        '/dashboardapprover': (context) => SurveyDashboardApprover(),
      },
    );
  }
}
