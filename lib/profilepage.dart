import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01012),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
//                centerTitle: true,
                title: Center(
                    widthFactor: 1.9, child: Headingg(text: 'My Profile')),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                ),

                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/settings');
                    },
                    icon: Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.39,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Column(children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 63,
                              backgroundColor: Color(0xFF7277F1),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(UserDetails().profilepic),
                                radius: 60,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.18,
                                top: MediaQuery.of(context).size.height * 0.12,
                              ),
                              child: Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/editprofile');
                                  },
                                  icon: Icon(
                                      MaterialCommunityIcons.account_edit,
                                      color: Color(0xff7277f1)),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            UserDetails().name,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF7277F1),
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Text(
                         UserDetails().username,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7277F1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          UserDetails().email,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7277F1),
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ),
                  )
//

                  ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                height: MediaQuery.of(context).size.height * 0.085,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/myprograms');
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 18,
                      ),
                      child: Text(
                        'My Programs',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7277F1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/myquestions');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.085,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 18,
                      ),
                      child: Text(
                        'My Questions',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7277F1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
