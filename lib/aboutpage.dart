import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/widgets.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "About",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBoxPadding(),
            LongButton(
              useIcon: true,
              title: "About Developers",
              onPressed: () {
                Navigator.pushNamed(context, '/developers');
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            LongButton(
              useIcon: true,
              title: "About API",
              onPressed: () {
                _modalBottomSheetMenu(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _modalBottomSheetMenu(context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (builder) {
      return SizedBox(
        height: 320.h,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36.h),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 47.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3.h,
                        ),
                        child: Image.asset(
                          'assets/images/api/jDoodle_logo.png',
                        ),
                      ),
                      SizedBox(
                        height: 47.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: ScreenUtil().setSp(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1.h,
                color: Color(0xff333333),
              ),
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  height: 272.h,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.w,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'What is JDoodle.com',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(14),
                              color: Color(0xff333333),
                            ),
                            children: [
                              TextSpan(
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Color(0xff333333),
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "\n\nJDoodle.com is an online education tool."
                                          "The aim of this website to help students learn programming online."
                                          "JDoodle offers following services:"
                                          "\n\n    *Online Compiler and IDE."
                                          "\n\n    *Online Terminals for Databases."
                                          "\n\n    *Compiler API."
                                          "\n\n    *Online Assessment."
                                          "\n\n    *Online Course (Coming Soon).")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
