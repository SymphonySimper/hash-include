import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButton extends StatelessWidget {
  final String title;
  final Function onPressed, onChanged;
  final bool useIcon, value;

  const LongButton(
      {Key key,
      this.title,
      this.onPressed,
      this.onChanged,
      this.useIcon,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 36.h,
      child: MaterialButton(
        color: Theme.of(context).colorScheme.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            Container(
              child: useIcon
                  ? Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).iconTheme.color,
                      size: Theme.of(context).iconTheme.size,
                    )
                  : CupertinoSwitch(
                      trackColor: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.65),
                      activeColor: Theme.of(context).colorScheme.onPrimary,
                      value: value,
                      onChanged: onChanged,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
