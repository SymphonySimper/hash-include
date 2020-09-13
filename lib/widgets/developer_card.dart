import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DeveloperCard extends StatelessWidget {
  final String image, name, oneLiner;

  const DeveloperCard({Key key, this.image, this.name, this.oneLiner})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 328.w,
            ),
            CircleAvatar(
              radius: 70.h,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            SizedBox(
              width: 16.h,
            ),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(24)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    oneLiner,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
