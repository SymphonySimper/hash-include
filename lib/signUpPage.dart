import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hashinclude/models/usermodel.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _confirmPassword;
  
  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }


  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.of(context).pop();

        Navigator.pushReplacementNamed(context, '/setupprofile');
      }
    });
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_password == _confirmPassword) {
        try {
          FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
              if(user!=null){
                UserDetails().updateUser('', '', _email, user.uid, '',user);
          Firestore.instance.collection('users').document(user.uid).setData({
            'email':_email,
         
          
          });
              }
        } catch (e) {
          // showError(e.message);
        }
      } else {
        // showError("passwords do not match");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 40,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                      child: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide an Email';
                          }
                        },
                        onSaved: (input) => _email = input,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'email',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Password should Be atleast 6 Characters';
                          }
                        },
                        onSaved: (input) => _password = input,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'password',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Password should Be atleast 6 Characters';
                          }
                        },
                        onSaved: (input) => _confirmPassword = input,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15),
                            hintText: 'confirm password',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 220,
                      ),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(36))),
                        onPressed:
                          signUp,

                        
                        child: Text('signup',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7277F1),
                              fontSize: 19,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 58.0),
                      child: OrLine(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: GoogleButton(
                        nav: 'asf',
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(112)),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}