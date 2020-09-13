import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWithIcon extends StatelessWidget {
  final double width, height, iconWidth, iconHeight;

  final ImageProvider<Object> avatar;
  final IconData icon;
  final Function iconOnPressed;
  final bool whiteIcon;

  const AvatarWithIcon(
      {Key key,
      this.width,
      this.height,
      this.iconWidth,
      this.iconHeight,
      this.avatar,
      this.icon,
      this.iconOnPressed,
      this.whiteIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            child: CircularProfileAvatar(
              null,
              child: CircleAvatar(
                backgroundImage: avatar,
              ),
              borderColor: whiteIcon
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
              borderWidth: 1.nsp,
              radius: 60.nsp,
            ),
          ),
          Positioned(
            bottom: 3.h,
            right: 8.w,
            child: SizedBox(
              width: iconWidth,
              height: iconHeight,
              child: FittedBox(
                child: FloatingActionButton(
                    backgroundColor: whiteIcon
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    child: FittedBox(
                      child: Icon(
                        icon,
                        color: whiteIcon
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).iconTheme.color,
                        size: Theme.of(context).iconTheme.size,
                      ),
                    ),
                    onPressed: iconOnPressed),
              ),
            ),
          )
        ],
      ),
    );
  }
}
