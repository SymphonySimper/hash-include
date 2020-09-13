import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/text_form_field_coloured.dart';
import 'package:hashinclude/widgets/widgets.dart';

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
          if (user != null) {
            UserDetails().updateUser('', '', _email, user.uid, '', user);
            Firestore.instance.collection('users').document(user.uid).setData({
              'email': _email,
            });
          }
        } catch (e) {
          showError("assets/images/iconImg/sad_face.png", e.message, context);
        }
      } else {
        showError("assets/images/iconImg/sad_face.png",
            "passwords do not match", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: "Sign up",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 36.h,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormFieldColoured(
                    hintText: 'email',
                    isWhite: true,
                    obscureText: false,
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Provide an Email';
                      }
                    },
                    onSaved: (input) => _email = input,
                  ),
                  SizedBoxPadding(),
                  TextFormFieldColoured(
                    hintText: 'password',
                    isWhite: true,
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 8) {
                        return 'Password should be atleast 8 characters';
                      }
                    },
                    onSaved: (input) => _password = input,
                  ),
                  SizedBoxPadding(),
                  TextFormFieldColoured(
                    hintText: 'confirm password',
                    isWhite: true,
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 8) {
                        return 'Password should Be atleast 8 Characters';
                      }
                    },
                    onSaved: (input) => _confirmPassword = input,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            SolidSmallButton(
              isWhite: false,
              title: 'Next',
              onPressed: signUp,
            ),
            SizedBox(
              height: 48.h,
            ),
            OrLine(),
            SizedBox(
              height: 48.h,
            ),
            CustomGoogleButton(
              text: 'Sign up with Google',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
