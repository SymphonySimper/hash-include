import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/usermodel.dart';

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
                       Firestore.instance.collection('users').document(user.uid).get().then((document){
               print('User details');
                print(document.data['name']);
                 UserDetails().updateUser(document.data['name'],document.data['username'], document.data['email'], user.uid, document.data['profilepicurl'],user);
               });


      
       Navigator.pushReplacementNamed(context, '/home');
      }else{
               Navigator.pushReplacementNamed(context, '/intro');

      }
    });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            
            child: Text(

                '#Include',
                style: GoogleFonts.poppins(
                  fontWeight:FontWeight.w600,
                  color:Colors.white,
                  fontSize: 55,
                ),
              ),
          ),
          ),
    );
  }
}
