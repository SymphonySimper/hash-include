import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hashinclude/models/usermodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
      @override
  void initState() {
    super.initState();
    checkAuthentication();
    super.initState();
    
  }
  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
       Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[ 
              Text(UserDetails().name),
Text(UserDetails().username),
Text(UserDetails().email),
Text(UserDetails().uid),
Image.network(UserDetails().profilepic),

            RaisedButton(
              onPressed: (){
                _auth.signOut();
              },
              child: Text(
              'Log out'
              
              
            ),)
            ]
          ),
        ),
      ),
    );
  }
}
