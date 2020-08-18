import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password, _confirmPassword, _username;

  _updateProfile() async{
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

try{
    Firestore.instance.collection('users').document(UserDetails().uid).updateData({'username':_username,});
    UserDetails().username=_username;
   FirebaseUser user= await FirebaseAuth.instance.currentUser();
   user.updatePassword(_password).then((value) {
print('password updated');
UserDetails().user=user;
   }).catchError((error){
     print(error);
   });

} catch(e){
  
}   
    }
  }

  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Container(
            // width: double.infinity,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Column(
              children: <Widget>[
                Column(children: [
                  Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01012),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Center(
                              widthFactor: 1.9,
                              child: Headingg(text: 'Edit Profile')),
                          leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // top: 180, left: 18
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.0102,
                        top: MediaQuery.of(context).size.height * 0.21,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.98,
                        height: MediaQuery.of(context).size.height * 0.72,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.65,
                                ),
                                child: Text(
                                  'Username',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xFF394AA3),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                    top: 4,
                                    left: MediaQuery.of(context).size.width *
                                        0.05,
                                    right: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Provide a valid username';
                                      }
                                    },
                                    onSaved: (input) => _username = input,

                                    initialValue: UserDetails().username,
                                    cursorColor: Colors.blue,
                                    //style: TextStyle(color: Colors.blue),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF394AA3))),
                                      contentPadding: EdgeInsets.only(
                                        top: 13,
                                      ),
                                    ),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.05,
                                  right:
                                      MediaQuery.of(context).size.width * 0.65,
                                ),
                                child: Text(
                                  'Password',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xFF394AA3),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.03,
                                    left: MediaQuery.of(context).size.width *
                                        0.05,
                                    right: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.length < 8) {
                                        return 'Provide a valid password';
                                      }
                                    },
                                    onSaved: (input) => _password = input,

                                    cursorColor: Colors.blue,
                                    //style: TextStyle(color: Colors.blue),
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF394AA3))),
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        hintText: 'new password',
                                        hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w200,
                                          color: Color(0xFF394AA3),
                                          fontSize: 15,
                                        )),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.03,
                                    left: MediaQuery.of(context).size.width *
                                        0.05,
                                    right: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  child: TextFormField(
                                    validator: (input) {
                                      if (input.length < 8) {
                                        return 'Provide a valid password';
                                      }
                                      if (input != _password) {
                                        return 'passwords dont match';
                                      }
                                    },

                                    onSaved: (input) =>
                                        _confirmPassword = input,

                                    cursorColor: Colors.blue,
                                    //style: TextStyle(color: Colors.blue),
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF394AA3))),
                                        contentPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        hintText: 'confirm password',
                                        hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w200,
                                          color: Color(0xFF394AA3),
                                          fontSize: 15,
                                        )),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.47,
                                ),
                                child: RaisedButton(
                                  padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32))),
                                  color: Color(0xFF394AA3),
                                  onPressed: _updateProfile,
                                  child: Text(
                                    'Confirm',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ])),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.37,
                      top: MediaQuery.of(context).size.height * 0.137,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF394AA3),
                        radius: 58,
                        child: CircleAvatar(
                          foregroundColor: Colors.red,

                          //  backgroundColor: Colors.blueAccent,
                          backgroundImage:
                              NetworkImage(UserDetails().profilepic),
                          radius: 55,
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.57,
                      top: MediaQuery.of(context).size.height * 0.257,
                      child: ClipOval(
                        child: Container(
                          color: Color(0xFF394AA3),
                          height: 27,
                          width: 27,
                          child: Icon(Icons.add, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                  ])
                ])
              ],
            ),
          ),
        )),
      ),
    );
  }
}
