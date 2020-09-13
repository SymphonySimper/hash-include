import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputBox extends StatefulWidget {
  @required
  final String hintText;
  final Function validator, onSaved;

  const InputBox({Key key, this.hintText, this.validator, this.onSaved})
      : super(key: key);
  @override
  _InputBoxState createState() =>
      _InputBoxState(this.hintText, this.validator, this.onSaved);
}

class _InputBoxState extends State<InputBox> {
  @required
  final String hintText;
  final Function validator, onSaved;

  _InputBoxState(this.hintText, this.validator, this.onSaved);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 36.h),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
        child: TextFormField(
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(14),
            color: Color(0xff333333),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: ScreenUtil().setSp(12),
              color: Color(0xff333333),
            ),
          ),
          minLines: 1,
          maxLines: 10,
          maxLengthEnforced: true,
          validator: validator,
          onSaved: onSaved,
        ),
      ),
    );
  }
}
