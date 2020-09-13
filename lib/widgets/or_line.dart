import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Container(
          width: 56.w,
          height: 1,
          color: Color(0xFFC4C4C4),
        ),
        SizedBox(
          width: 24.w,
        ),
        Text(
          'or',
          style: GoogleFonts.poppins(
            fontSize: ScreenUtil().setSp(12),
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        Container(
          width: 56.w,
          height: 1,
          color: Color(0xFFC4C4C4),
        ),
        Expanded(
            child: SizedBox(
          width: 10,
        )),
      ],
    );
  }
}
