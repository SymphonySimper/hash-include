import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
   final FirebaseAuth _auth = FirebaseAuth.instance;
  login(String email ,String password)async{
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
               Firestore.instance.collection('users').document(user.uid).get().then((document){
               print('User details');
                print(document.data['name']);
                 UserDetails().updateUser(document.data['name'],document.data['username'], document.data['email'], user.uid, document.data['profilepicurl'],user);
               });

         

    } catch (e) {
      showError(e.message,context);
    }
  }
    @override
  void initState() {
    super.initState();
    checkAuthentication();
    super.initState();
    
  }
  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
       Navigator.of(context).pop();
       Navigator.pushReplacementNamed(context, '/home');
      }
    });
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
                    'Sign in',
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
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      controller: _passwordController,
                      cursorColor: Colors.white,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        hintText: 'password',
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
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/signup");
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: RichText(
                          text: TextSpan(
                            text: 'No account? ',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Create one!',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
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
                              onPressed: () {
                                login(_emailController.text, _passwordController.text);
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
                      ],
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
                            Text('Sign in with Google',
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
