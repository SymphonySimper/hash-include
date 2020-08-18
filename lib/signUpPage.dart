import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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

          showError(e.message,context);
        }
      } else {
        showError("passwords do not match",context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: ThemeColor().returnColor())),
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                title: Align(
                  alignment: Alignment(-0.3, 0),
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
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
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length < 8) {
                                return 'Password should be atleast 8 characters';
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
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length < 8) {
                                return 'Password should Be atleast 8 Characters';
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
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 15),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(36))),
                        onPressed:
                          signUp,
                       
                        child: Text('Next',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7277F1),
                              fontSize: 19,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: OrLine(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Center(
                        child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(30, 11, 30, 11),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      onPressed: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image.asset(
                              'images/Google_image.png',
                              scale: 2.5,
                            ),
                            Text('Sign up with Google',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF7277F1),
                                  fontSize: 17,
                                )),
                          ],
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
