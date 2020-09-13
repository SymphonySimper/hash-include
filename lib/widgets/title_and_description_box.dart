import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndDescriptionBox extends StatefulWidget {
  @required
  final Widget avatar, votes, button1, button2, button3;
  @required
  final String username,
      programOrQuestion,
      date,
      titleContent,
      descriptionContent;

  const TitleAndDescriptionBox(
      {Key key,
      this.avatar,
      this.votes,
      this.button1,
      this.button2,
      this.button3,
      this.username,
      this.programOrQuestion,
      this.date,
      this.titleContent,
      this.descriptionContent})
      : super(key: key);
  @override
  _TitleAndDescriptionBoxState createState() => _TitleAndDescriptionBoxState(
      this.avatar,
      this.votes,
      this.button1,
      this.button2,
      this.button3,
      this.username,
      this.programOrQuestion,
      this.date,
      this.titleContent,
      this.descriptionContent);
}

class _TitleAndDescriptionBoxState extends State<TitleAndDescriptionBox> {
  @required
  final Widget avatar, votes, button1, button2, button3;
  @required
  final String username,
      programOrQuestion,
      date,
      titleContent,
      descriptionContent;

  _TitleAndDescriptionBoxState(
      this.avatar,
      this.votes,
      this.button1,
      this.button2,
      this.button3,
      this.username,
      this.programOrQuestion,
      this.date,
      this.titleContent,
      this.descriptionContent);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: SizedBox(
                height: 56.h,
                child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                      leading: avatar,
                      title: RichText(
                        text: TextSpan(
                          text: username,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF333333),
                            fontSize: ScreenUtil().setSp(12),
                          ),
                          children: [
                            TextSpan(
                              text: programOrQuestion,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF828282),
                                fontSize: ScreenUtil().setSp(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        date,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF828282),
                          fontSize: ScreenUtil().setSp(10),
                        ),
                      ),
                      trailing: votes),
                ),
              ),
            ),
            Container(
              height: 1.h,
              color: Color(0xff7277f1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Title',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF828282),
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 4.h, 0, 16.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        titleContent,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF828282),
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        descriptionContent,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF333333),
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.h,
              color: Color(0xff7277f1),
            ),
            SizedBox(
              height: 48.h,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      child: button1,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      child: button2,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Container(
                      child: button3,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
