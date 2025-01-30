import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kBlackColor = Color(0xff1F1449);
Color kWhiteColor = Color(0xffFFFFFF);
Color kGreyColor = Color(0xff768386);
Color kGreenColor = Color(0xff0EC3AE);
Color kRedColor = Color(0xFFE870A5);
Color kPrimaryColor = Color(0xff4DC3DE);
Color kSecondaryColor = Color(0xffC2EAFF);
Color kInactiveColor = Color(0xffDBD7EC);
Color kLoginFontColor = Color(0xff33A2CC);
Color kSurveyBgColor = Color(0xffEAFBFF);
Color kSurveyFontColor = Color(0xff0D5773);
Color kTrsnsparentColor = Colors.transparent;
Gradient kPrimaryBackground = LinearGradient(
  colors: [kPrimaryColor, kSecondaryColor],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

TextStyle blackTextStyle = GoogleFonts.poppins(color: kBlackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: kWhiteColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: kGreyColor);
TextStyle blueTextStyle = GoogleFonts.poppins(color: kLoginFontColor);
TextStyle darkblueTextStyle = GoogleFonts.poppins(color: kSurveyFontColor);

double defaultMargin = 24.0;
double defaultRadius = 17.0;

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
FontWeight black = FontWeight.w900;
