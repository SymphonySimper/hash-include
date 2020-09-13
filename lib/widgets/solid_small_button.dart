import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolidSmallButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool isWhite;

  const SolidSmallButton({Key key, this.onPressed, this.title, this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 112.w,
        height: 32.h,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.h),
          ),
          onPressed: onPressed,
          color: isWhite
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          child: Text(
            title,
            style: isWhite
                ? Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).colorScheme.primary)
                : Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
