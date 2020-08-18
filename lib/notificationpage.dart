import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widget.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(
              top:MediaQuery.of(context).size.height*0.08,
              left:MediaQuery.of(context).size.width*0.06,
            ),
            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left:MediaQuery.of(context).size.width*0.065,
                      ),
                    child: Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 34,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
          ),
//
          Stack(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.96,
              height:  MediaQuery.of(context).size.height*0.76,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 1.0,
                  top: 10,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: ListView(
                    children: [
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                      NotificationsCard(
                        text: 'Piu has commented on your post',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}