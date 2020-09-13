import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/widgets.dart';

class NotificationsCard extends StatefulWidget {
  final String text;
  NotificationsCard({@required this.text});
  @override
  _NotificationsCardState createState() => _NotificationsCardState(this.text);
}

class _NotificationsCardState extends State<NotificationsCard> {
  final String text;
  _NotificationsCardState(this.text);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 328.w,
      height: 56.h,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                SizedBox(
                  height: 55.h,
                ),
                Icon(
                  MaterialCommunityIcons.message,
                  size: ScreenUtil().setSp(24),
                  color: Color(
                    0xFFA1A4F1,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                RichText(
                  text: TextSpan(
                    text: text,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil().setSp(14),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '  3d',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF828282),
                          fontSize: ScreenUtil().setSp(12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.h,
            color: Color(0xff7277F1),
          )
        ],
      ),
    );
  }
}
