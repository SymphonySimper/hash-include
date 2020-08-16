import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), checkAuthentication);
  }

  checkAuthentication() async {
    print('authentication called here');
  _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
      
       Navigator.pushReplacementNamed(context, '/home');
      }else{
               Navigator.pushReplacementNamed(context, '/intro');

      }
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.amber,
          child: Center(
            child: Text('HAsh INclude'),
          )),
    );
  }
}
