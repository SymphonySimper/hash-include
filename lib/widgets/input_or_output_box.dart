import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputOrOutputBox extends StatelessWidget {
  final String title, content;

  const InputOrOutputBox({Key key, this.title, this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 64.h,
        maxHeight: 215.h,
      ),
      child: SizedBox(
        width: 328.w,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setSp(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF828282),
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        content,
                        style: GoogleFonts.sourceCodePro(
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
          ),
        ),
      ),
    );
  }
}
