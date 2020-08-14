import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

import 'localWidgets.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Headingg(
                    text: 'Profile',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: SizedBox(
                width: 390,
                height: 280,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Column(children: [
                      AvatarColor(
                        colorradius: 63,
                        radius: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Shrek',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7277F1),
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Text(
                        '@shrek2020',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7277F1),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'shrek@gmail.com',
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
              width: 390,
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                      right: 228,
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'My Programs',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7277F1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              width: 390,
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                      right: 228,
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'My Questions',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF7277F1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
