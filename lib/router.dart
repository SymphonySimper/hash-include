import 'package:flutter/material.dart';
import 'package:hashinclude/homepage.dart';
import 'package:hashinclude/introPage.dart';
import 'package:hashinclude/loginpage.dart';
import 'package:hashinclude/setupprofile.dart';
import 'package:hashinclude/signuppage.dart';
import 'package:hashinclude/splashscreen.dart';

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
        return MaterialPageRoute(builder: (context) => SignUpPage());
        case '/setupprofile':
        return MaterialPageRoute(builder: (context) => SetUpProfilePage());
    }
  }
}
