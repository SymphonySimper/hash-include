import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FittedSmallAvatar extends StatelessWidget {
  @required
  final NetworkImage image;

  const FittedSmallAvatar({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return FittedBox(
      child: CircularProfileAvatar(
        null,
        child: CircleAvatar(
          backgroundImage: image,
        ),
        borderColor: Color(0xFF7277F1),
        borderWidth: ScreenUtil().setSp(1),
        radius: ScreenUtil().setSp(36),
      ),
    );
  }
}
