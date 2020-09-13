import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TagButton extends StatelessWidget {
  final String name;
  final Function onPressed;

  const TagButton({Key key, this.name, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 112.w,
      child: OutlineButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: ScreenUtil().setSp(12),
          ),
        ),
        shape: StadiumBorder(),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: ScreenUtil().setSp(1),
        ),
      ),
    );
  }
}
