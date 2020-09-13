import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/widgets/widgets.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {

    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: "Notifications",
      ),
      child: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.h),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h)),
                child: ListView(
                  children: [
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                    NotificationsCard(
                      text: 'Piu has commented on your post',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
