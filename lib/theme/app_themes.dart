import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  AppTheme._();

  // Light Theme

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightSecondaryColor = Color(0xff333333);
  static const Color _lightOnPrimaryColor = Color(0xff7277F1);
  static const Color _lightDisabledColor = Color(0xffBDBDBD);
  static const Color _lightGradBegin = Color(0xFFCD37FF);
  static const Color _ligthGradEnd = Color(0xFF40C9FF);
  static const Color _lightOnSecondaryColor = Color(0xff828282);

  static final ThemeData lightTheme = ThemeData(
    accentColor: _lightOnPrimaryColor,
    primaryColor: _lightPrimaryColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
      primaryVariant: _lightGradBegin,
      secondaryVariant: _ligthGradEnd,
      onSecondary: _lightOnSecondaryColor,
    ),
    disabledColor: _lightDisabledColor,
    unselectedWidgetColor: _lightPrimaryColor,
    cursorColor: _lightOnPrimaryColor,
    iconTheme: IconThemeData(
      color: _lightOnPrimaryColor,
      size: 24.nsp,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: _lightPrimaryColor, size: 24.nsp),
      textTheme: TextTheme(headline6: _lightAppBarTitle),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      splashColor: _lightOnPrimaryColor.withOpacity(0.50),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(top: 16.h),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: _lightOnPrimaryColor,
          width: 0.0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: _lightOnPrimaryColor,
          width: 1.0,
        ),
      ),
      hintStyle: _lightHintText,
    ),
    textTheme: TextTheme(
      headline2: _lightGeneralTitleText,
      headline3: _lightProgramUsernameText,
      headline4: _lightCodeText,
      button: _lightButtonText,
      overline: _lightOverlineText,
    ),
  );

  // Text Theme Light

  static TextStyle _lightAppBarTitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: _lightPrimaryColor,
    fontSize: 24.nsp,
  );
  static TextStyle _lightGeneralTitleText = TextStyle(
    fontFamily: 'Poppins',
    color: _lightOnPrimaryColor,
    fontSize: 14.nsp,
  );
  static TextStyle _lightProgramUsernameText = TextStyle(
    fontFamily: 'Poppins',
    color: _lightSecondaryColor,
    fontSize: 10.ssp,
  );
  static TextStyle _lightCodeText = TextStyle(
    fontFamily: 'SourceCodePro',
    color: _lightSecondaryColor,
    fontSize: 12.ssp,
  );
  static TextStyle _lightHintText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: _lightPrimaryColor,
    fontSize: 12.ssp,
  );
  static TextStyle _lightButtonText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: _lightOnPrimaryColor,
    fontSize: 14.ssp,
  );
  static TextStyle _lightOverlineText = TextStyle(
    fontFamily: 'Poppins',
    color: _lightPrimaryColor,
    fontSize: 8.ssp,
  );

  // Dark Theme

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.dark,
      primary: _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    textTheme: TextTheme(headline1: _darkAppBarTitle),
  );

// Text Theme Dark
  static TextStyle _darkAppBarTitle =
      _lightAppBarTitle.copyWith(color: _darkPrimaryColor);
}
