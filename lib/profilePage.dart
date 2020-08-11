import 'package:flutter/material.dart';
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
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Headingg(
                    text: 'Profile',
                  ),
                ),
              ],
            ),
          ),
          Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 78.0),
              child: Avatar(
                radius: 55,
              ),
            ),
          ]),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/editprofile');
            },
            child: Text('edit'),
          )
        ]),
      ),
    );
  }
}
