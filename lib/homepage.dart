import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hashinclude/addprogram.dart';
import 'package:hashinclude/addquestion.dart';
import 'package:hashinclude/chat.dart';
import 'package:hashinclude/playground.dart';
import 'package:hashinclude/profilepage.dart';
import 'package:hashinclude/programs.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
      Programs(),
    Chat(),
    PlayGround(),
    ProfilePage(),    
  ];

  Color iconNotSelected = Color(0xFFBDBDBD);
  Color iconSelected = Color(0xFF7277F1);

  Widget currentScreen = Programs();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: Align(
        alignment: Alignment(0, 0.95),
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF70AEFF), Color(0xFFB76AFF)]),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF7277F1).withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 16,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],
            ),
            child: Transform.rotate(
              angle: math.pi / 4,
              child: MaterialButton(
                onPressed: () {
                  currentTab == 0
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddProgram()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddQuestion()),
                        );
                },
                child: Icon(
                  currentTab == 1 ? AntDesign.question : Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.0875,
          // height: 56,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Octicons.home,
                    color: currentTab == 0 ? iconSelected : iconNotSelected,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Programs();
                      currentTab = 0;
                    });
                  }),
              IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.message_outline,
                    color: currentTab == 1 ? iconSelected : iconNotSelected,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Chat();
                      currentTab = 1;
                    });
                  }),
              SizedBox(
                width: 56,
              ),
              IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.code_tags,
                    color: iconNotSelected,
                  ),
                  onPressed: () {
                    currentTab = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayGround()),
                    );
                  }),
              IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.account_outline,
                    color: iconNotSelected,
                  ),
                  onPressed: () {
                    currentTab = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
