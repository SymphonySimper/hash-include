import 'package:flutter/material.dart';
import 'package:hashinclude/myPrograms.dart';
import 'package:hashinclude/playGround.dart';

import 'editProfilePage.dart';
import 'introPage.dart';
import 'login.dart';
import 'lopPAge.dart';
import 'myPrograms.dart';
import 'noticationPage.dart';
import 'playGround.dart';
import 'profilePage.dart';
import 'questionsPage.dart';
import 'setUpProfile.dart';
import 'signUpPage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/intro':
        return MaterialPageRoute(builder: (context) => IntroPage());
//      case '/':
//        return MaterialPageRoute(builder: (context) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());

      case '/signup':
        return MaterialPageRoute(builder: (context) => SignupPage());
      case '/setupprofile':
        return MaterialPageRoute(builder: (context) => SetupProfilePage());
      case '/lop':
        return MaterialPageRoute(builder: (context) => ListofProg());
      case '/profile':
        return MaterialPageRoute(builder: (context) => Profile());
      case '/editprofile':
        return MaterialPageRoute(builder: (context) => EditProfile());
      case '/notification':
        return MaterialPageRoute(builder: (context) => Notifications());
      case '/playground':
        return MaterialPageRoute(builder: (context) => PlayGround());
      case '/questions':
        return MaterialPageRoute(builder: (context) => Questions());
      case '/myprograms':
        return MaterialPageRoute(builder: (context) => MyPrograms());
        break;
    }
  }
}
