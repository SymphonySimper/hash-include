import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/solid_small_button.dart';
import 'package:hashinclude/widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password, _confirmPassword, _username;

  _updateProfile() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        Firestore.instance
            .collection('users')
            .document(UserDetails().uid)
            .updateData({
          'username': _username,
        });
        UserDetails().username = _username;
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        user.updatePassword(_password).then((value) {
          print('password updated');
          UserDetails().user = user;
        }).catchError((error) {
          print(error);
        });
      } catch (e) {}
    }
  }

  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "Edit Profile",
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                width: 328.w,
                height: 443.h,
                child: Stack(children: [
                  SizedBox(
                    width: 328.w,
                    height: 403.h,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: Column(
                          children: [
                            Spacer(
                              flex: 2,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Username',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            Spacer(),
                            TextFormFieldColoured(
                              isWhite: false,
                              obscureText: false,
                              initialValue: UserDetails().username,
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Provide a valid username';
                                }
                              },
                              onSaved: (input) => _username = input,
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Password',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            TextFormFieldColoured(
                              isWhite: false,
                              obscureText: true,
                              hintText: 'new password',
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Provide a valid password';
                                }
                              },
                              onSaved: (input) => _password = input,
                            ),
                            Spacer(),
                            TextFormFieldColoured(
                              isWhite: false,
                              obscureText: true,
                              hintText: 'confirm password',
                              validator: (input) {
                                if (input.length < 8) {
                                  return 'Provide a valid password';
                                }
                                if (input != _password) {
                                  return 'passwords dont match';
                                }
                              },
                              onSaved: (input) => _confirmPassword = input,
                            ),
                            Spacer(),
                            SolidSmallButton(
                              title: 'Confirm',
                              onPressed: _updateProfile,
                              isWhite: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -1.25),
                    child: AvatarWithIcon(
                      width: 80.w,
                      height: 80.h,
                      
                      avatar: UserDetails().profilepic == null
                          ? NetworkImage(
                              'https://cdn.auth0.com/blog/illustrations/flutter.png')
                          : NetworkImage(UserDetails().profilepic),
                      icon: Icons.add,
                      whiteIcon: true,
                      iconHeight: 24.h,
                      iconWidth: 24.w,
                      iconOnPressed: () {},
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
