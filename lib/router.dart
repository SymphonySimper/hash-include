import 'package:flutter/material.dart';
import 'package:hashinclude/aboutpage.dart';
import 'package:hashinclude/carousel.dart';
import 'package:hashinclude/developerspage.dart';
import 'package:hashinclude/editprofilepage.dart';
import 'package:hashinclude/homepage.dart';
import 'package:hashinclude/introPage.dart';
import 'package:hashinclude/loginpage.dart';
import 'package:hashinclude/myprogramspage.dart';
import 'package:hashinclude/myquestions.dart';
import 'package:hashinclude/settingspage.dart';
import 'package:hashinclude/setupprofile.dart';
import 'package:hashinclude/signuppage.dart';
import 'package:hashinclude/splashscreen.dart';
import 'notificationpage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignupPage());
      case '/setupprofile':
        return MaterialPageRoute(builder: (context) => SetupProfilePage());
      case '/myquestions':
        return MaterialPageRoute(builder: (context) => MyQuestions());
      case '/myprograms':
        return MaterialPageRoute(builder: (context) => MyPrograms());
      case '/notifications':
        return MaterialPageRoute(builder: (context) => Notifications());
      case '/editprofile':
        return MaterialPageRoute(builder: (context) => EditProfile());
      case '/settings':
        return MaterialPageRoute(builder: (context) => Settings());
      case '/developers':
        return MaterialPageRoute(
            builder: (context) => ListWheelScrollViewApp());
      case '/carousel':
        return MaterialPageRoute(builder: (context) => OnBoardingPage());
      case '/about':
        return MaterialPageRoute(builder: (context) => About());
      // case '/about':
      // return MaterialPageRoute(builder: (context) => About());
    }
  }
}
