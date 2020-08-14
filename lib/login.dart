import 'dart:async';
import 'dart:convert' show json;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hashinclude/localWidgets.dart';
import "package:http/http.dart" as http;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatefulWidget {
//  GoogleSignInAccount _currentUser;
//  String _contactText;

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
//        Navigator.of(context).pop();
//        Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  GoogleSignInAccount _currentUser;
  String _contactText;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact();
      }
    });
    _googleSignIn.signInSilently();
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

  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          Text(_contactText ?? ''),
          RaisedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          RaisedButton(
            child: const Text('REFRESH'),
            onPressed: _handleGetContact,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text("You are not currently signed in."),
          RaisedButton(
            child: const Text('SIGN IN'),
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  @override

  //////////////////////////////////////////
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
//                        signIn(_emailController.text, _passwordController.text);
//                        Navigator.pushReplacementNamed(context, '/lop');
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
                child: Container(
                  // padding: const EdgeInsets.only(top: 60),
                  child: Center(
//                    padding: EdgeInsets.fromLTRB(170, 80, 10, 20),
                      child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(30, 11, 30, 11),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(36))),
                    onPressed: () {
                      _handleSignIn;
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 26.0),
                      child: Text('Sign in with Google',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7277F1),
                            fontSize: 17,
                          )),
                    ),
                  )),
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
