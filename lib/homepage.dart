import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

  Widget currentScreen = Programs();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Color iconNotSelected = Theme.of(context).disabledColor;
    Color iconSelected = Theme.of(context).colorScheme.onPrimary;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: Align(
        alignment: Alignment(0, 0.95),
        child: FractionallySizedBox(
          heightFactor: 0.0875,
          child: AspectRatio(
            aspectRatio: 1,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF70AEFF), Color(0xFFB76AFF)]),
                  borderRadius: BorderRadius.circular(8.h),
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
                                MaterialPageRoute(
                                    builder: (context) => AddProgram()),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddQuestion()),
                              );
                      },
                      child: Text(
                        currentTab == 1 ? "?" : "+",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(25),
                        ),
                      )),
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
        child: SizedBox(
          height: 56.h,
          width: 360.w,
          child: Row(
            children: [
              SizedBox(
                height: 56.h,
                width: 56.w,
                child: IconButton(
                    icon: Icon(
                      Octicons.home,
                      color: currentTab == 0 ? iconSelected : iconNotSelected,
                      // size: ScreenUtil().setSp(24),
                      size: 24.nsp,
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = Programs();
                        currentTab = 0;
                      });
                    }),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                height: 56.h,
                width: 56.w,
                child: IconButton(
                    icon: Icon(
                      MaterialCommunityIcons.message_outline,
                      color: currentTab == 1 ? iconSelected : iconNotSelected,
                      size: 24.nsp,
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = Chat();
                        currentTab = 1;
                      });
                    }),
              ),
              SizedBox(
                height: 56.h,
                width: 112.w,
              ),
              SizedBox(
                height: 56.h,
                width: 56.w,
                child: IconButton(
                    icon: Icon(
                      MaterialCommunityIcons.code_tags,
                      color: iconNotSelected,
                      size: 24.nsp,
                    ),
                    onPressed: () {
                      currentTab = 1;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlayGround()),
                      );
                    }),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                height: 56.h,
                width: 56.w,
                child: IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.account_outline,
                    color: iconNotSelected,
                    size: 24.nsp,
                  ),
                  onPressed: () {
                    currentTab = 3;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
