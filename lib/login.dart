import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  signIn(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
    } catch (e) {
      showError(e.message);
    }
  }

  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: ListView(children: [
              Stack(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 28, 0, 0),
                  alignment: Alignment(0, 1),
                  child: Text(
                    'Sign in',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 5, top: 23),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
//                          Navigator.pushReplacementNamed(context, '/intro');
                          Navigator.of(context).pop();
                        })),
              ]),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 65),
                child: TextField(
                  controller: _emailController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    hintText: 'email',
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13, 15, 13, 0),
                child: TextField(
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      hintText: 'password',
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              Stack(children: [
                Column(children: [
                  Stack(children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 37, 230, 2),
                      child: Text('No account? ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                            fontSize: 14,
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 90, top: 24),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/signup");
                            },
                            child: Text(' Create one!',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 14,
                                ))))
                  ])
                ]),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 93, 250, 0),
                    child: Text('Forgot password?',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(260, 80, 0, 0),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(36))),
                      onPressed: () {
                        // signIn(
                        //     _emailController.text, _passwordController.text);
                        Navigator.pushReplacementNamed(context, '/lop');
                      },
                      child: Text('Sign in',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7277F1),
                            fontSize: 19,
                          )),
                    ),
                  ),
                ),
              ]),

//                    Buttons(
//                text: 'hello',
//                nav: '/intro',
//              ),

              Padding(
                padding: const EdgeInsets.only(top: 60, left: 58.0),
                child: OrLine(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: GoogleButton(
                  nav: 'osdsd',
                ),
              ),

//              Container(
//                  padding: EdgeInsets.fromLTRB(80, 258, 0, 0),
//                  child: Text(
//                    'SRI SAIRAM COLLEGE OF ENGINEERING',
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),
//                  )),
            ])),
      ),
    );
  }
}
