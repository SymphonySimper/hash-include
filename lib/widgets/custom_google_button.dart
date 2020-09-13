import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGoogleButton extends StatelessWidget {
  @required
  final String text;
  @required
  final Function onPressed;

  const CustomGoogleButton({Key key, this.text, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178.w,
      height: 36.h,
      child: FlatButton(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.h)),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                width: 16.w,
              ),
            ),
            SizedBox(
              width: 14.w,
              height: 14.h,
              child: FittedBox(
                child: Image.asset(
                  'assets/images/Google_image.png',
                ),
              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            FittedBox(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7277F1),
                  fontSize: ScreenUtil().setSp(12),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 16.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
