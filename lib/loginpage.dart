import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  login(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      Firestore.instance
          .collection('users')
          .document(user.uid)
          .get()
          .then((document) {
        print('User details');
        print(document.data['name']);
        UserDetails().updateUser(
            document.data['name'],
            document.data['username'],
            document.data['email'],
            user.uid,
            document.data['profilepicurl'],
            user);
      });
    } catch (e) {
      showError("images/sad_face.png", e.message, context);
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
    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: "Sign in",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 36.h,
                ),
                TextFieldColoured(
                  hintText: 'email',
                  obscureText: false,
                  isWhite: true,
                  controller: _emailController,
                ),
                SizedBoxPadding(),
                TextFieldColoured(
                  hintText: 'password',
                  obscureText: true,
                  isWhite: true,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/signup");
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'No account? ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(10),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Create one!',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(10),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(11),
                      ),
                    ),
                    SolidSmallButton(
                      isWhite: false,
                      title: 'Sign in',
                      onPressed: () {
                        login(_emailController.text, _passwordController.text);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                OrLine(),
                SizedBox(
                  height: 48.h,
                ),
                CustomGoogleButton(
                  text: 'Sign in with Google',
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
