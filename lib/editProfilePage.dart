import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
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
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(top: 25, left: 140),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      top: 23,
                      right: 355,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 27,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/profile");
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                  ),
                  //////////]),

                  Container(
                    padding: EdgeInsets.only(top: 180, left: 18),
                    child: SizedBox(
                      width: 380,
                      height: 480,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: 60,
                                right: 240,
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
                                  left: 20,
                                  right: 20,
                                ),
                                child: TextField(
                                  cursorColor: Colors.blue,
                                  //style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF394AA3))),
                                      contentPadding: EdgeInsets.only(
                                        top: 13,
                                      ),
                                      hintText: 'ashik',
                                      hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF394AA3),
                                      )),
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                top: 37,
                                right: 250,
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
                                  top: 4,
                                  left: 20,
                                  right: 20,
                                ),
                                child: TextField(
                                  cursorColor: Colors.blue,
                                  //style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF394AA3))),
                                      contentPadding: EdgeInsets.only(
                                        top: 18,
                                      ),
                                      hintText: 'old password',
                                      hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w200,
                                        color: Color(0xFF394AA3),
                                        fontSize: 15,
                                      )),
                                )),
                            Container(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                ),
                                child: TextField(
                                  cursorColor: Colors.blue,
                                  //style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF394AA3))),
                                      contentPadding: EdgeInsets.only(
                                        top: 18,
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
                                  top: 20,
                                  left: 20,
                                  right: 20,
                                ),
                                child: TextField(
                                  cursorColor: Colors.blue,
                                  //style: TextStyle(color: Colors.blue),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF394AA3))),
                                      contentPadding: EdgeInsets.only(
                                        top: 18,
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
                                top: 25,
                                left: 200,
                              ),
                              child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(30, 6, 30, 6),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32))),
                                color: Color(0xFF394AA3),
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/profile');
                                  Navigator.pushReplacementNamed(
                                      context, '/profile');
                                  //Navigator.of(context).pushNamed("/username");
                                },
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
                    left: 153,
                    //bottom: 390,
                    top: 93,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF394AA3),
                      radius: 58,
                      child: CircleAvatar(
                        foregroundColor: Colors.red,

                        //  backgroundColor: Colors.blueAccent,
                        backgroundImage: AssetImage('images/avatar.png'),
                        radius: 55,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 237,
                    top: 179,
                    child: ClipOval(
                      child: Container(
                        color: Color(0xFF394AA3),
                        height: 27,
                        width: 27,
                        child: Icon(Icons.add, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    height: sideLength,
                    width: sideLength,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                          child: InkWell(
                            child: Text('hello'),
                            onTap: () {
                              setState(() {
                                sideLength == 50
                                    ? sideLength = 100
                                    : sideLength = 50;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]) /////////////////
              ])
            ],
          ),
        )),
      ),
    );
  }
}
