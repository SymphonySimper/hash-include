import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/sizedbox_padding.dart';

class SearchBarAndNotification extends StatefulWidget
    implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchBarAndNotification({Key key, this.controller}) : super(key: key);
  @override
  _SearchBarAndNotificationState createState() =>
      _SearchBarAndNotificationState(this.controller);
  Size get preferredSize => Size.fromHeight(56.h);
}

class _SearchBarAndNotificationState extends State<SearchBarAndNotification> {
  final TextEditingController controller;

  _SearchBarAndNotificationState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxPadding(),
        Row(
          children: [
            SizedBox(
              height: 36.h,
              width: 276.w,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(36.h),
                      bottomRight: Radius.circular(36.h)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                        autofocus: false,
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search Programs',
                          hintStyle: Theme.of(context)
                              .inputDecorationTheme
                              .hintStyle
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 8.h),
                          suffixIcon: Icon(
                            EvaIcons.search,
                            color: Theme.of(context).iconTheme.color,
                            size: Theme.of(context).iconTheme.size,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 32.w,
            ),
            SizedBox(
              width: 36.w,
              height: 36.h,
              child: FloatingActionButton(
                elevation: 0,
                child: Icon(
                  Icons.notifications,
                  color: Color(0xff7277F1),
                  size: ScreenUtil().setSp(24),
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
      ],
    );
  }
}
