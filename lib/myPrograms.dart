import 'package:flutter/material.dart';
import 'package:hashinclude/localWidgets.dart';

class MyPrograms extends StatefulWidget {
  @override
  _MyProgramsState createState() => _MyProgramsState();
}

class _MyProgramsState extends State<MyPrograms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(children: [
            Column(
              children: <Widget>[
                Center(
                  heightFactor: 1.3,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
//                centerTitle: true,
                    title: Center(
                        widthFactor: 1.5, child: Headingg(text: 'My Programs')),
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
            MyProgCard(
              text: 'hi',
            ),
          ]),
        ),
      ),
    );
  }
}
