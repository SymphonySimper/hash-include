import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/widgets.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {

    return BackgroundBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 96.h,
              ),
              SizedBox(
                width: 120.w,
                height: 120.h,
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          SizedBox(
            height: 64.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Let's get started",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w100,
                fontSize: ScreenUtil().setSp(36),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 64.h,
          ),
          SizedBox(
            width: 212.w,
            height: 36.h,
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.h)),
              child: Text(
                'Sign in',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              borderSide: BorderSide(
                  color: Colors.white, style: BorderStyle.solid, width: 2),
            ),
          ),
          SizedBoxPadding(),
          SizedBox(
            width: 212.w,
            height: 36.h,
            child: FlatButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.h)),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'Sign up',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(14),
                  color: Color(0xff7277f1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 64.h,
          ),
        ],
      ),
    );
  }
}
