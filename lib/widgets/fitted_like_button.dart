import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';

class FittedLikeButton extends StatefulWidget {
  final Color primaryColor;
  final IconData selectedIcon, unSelectedIcon;
  final int likes;
  final String type;
  final DocumentSnapshot document;
  const FittedLikeButton(
      {Key key,
      this.primaryColor,
      this.selectedIcon,
      this.unSelectedIcon,
      this.likes,
      this.type,
      this.document})
      : super(key: key);

  @override
  _FittedLikeButtonState createState() => _FittedLikeButtonState(
      this.primaryColor,
      this.selectedIcon,
      this.unSelectedIcon,
      this.likes,
      this.type,
      this.document);
}

class _FittedLikeButtonState extends State<FittedLikeButton> {
  @required
  final Color primaryColor;
  @required
  final IconData selectedIcon, unSelectedIcon;
  @required
  final int likes;
  @required
  final String type;
  final DocumentSnapshot document;
  _FittedLikeButtonState(this.primaryColor, this.selectedIcon,
      this.unSelectedIcon, this.likes, this.type, this.document);

  @override
  Widget build(BuildContext context) {

    return FittedBox(
      child: LikeButton(
       
        countPostion: CountPostion.bottom,
        size: ScreenUtil().setSp(24),
        circleColor: CircleColor(
          start: primaryColor.withOpacity(0.5),
          end: primaryColor,
        ),
        bubblesColor: BubblesColor(
          dotPrimaryColor: primaryColor,
          dotSecondaryColor: primaryColor.withOpacity(0.5),
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            isLiked ? selectedIcon : unSelectedIcon,
            size: ScreenUtil().setSp(24),
            color: isLiked ? primaryColor : primaryColor.withOpacity(0.5),
          );
        },
        likeCount: likes,
        countBuilder: (int count, bool isLiked, String text) {
          var color = isLiked ? primaryColor : primaryColor.withOpacity(0.5);
          Widget result;
          if (count == 0) {
            result = Text(
              type,
              style: TextStyle(color: color),
            );
          } else
            result = Text(
              text,
              style: TextStyle(color: color),
            );
          return result;
        },
      ),
    );
  }
}
