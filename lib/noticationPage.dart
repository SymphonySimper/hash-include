import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

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
          Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/lop');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 52.0,
                    left: 55,
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
//
          Stack(children: [
            SizedBox(
              width: 370,
              height: 550,
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
