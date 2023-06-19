import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "My Profile",
        actionIcon: Icons.settings,
        actionOnPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                  width: 328.w,
                  height: 211.h,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Column(children: [
                        AvatarWithIcon(
                          width: 100.w,
                          height: 100.h,
                          whiteIcon: true,
                          iconHeight: 32.h,
                          iconWidth: 32.w,
                    
                          avatar: UserDetails().profilepic == null
                              ? NetworkImage(
                                  'https://cdn.auth0.com/blog/illustrations/flutter.png')
                              : NetworkImage(UserDetails().profilepic),
                          icon: MaterialCommunityIcons.account_edit,
                          iconOnPressed: () {
                            Navigator.of(context).pushNamed('/editprofile');
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            UserDetails().name == null
                                ? "No Name"
                                : UserDetails().name,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF7277F1),
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(18),
                            ),
                          ),
                        ),
                        Text(
                          UserDetails().username == null
                              ? 'No Username'
                              : UserDetails().username,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7277F1),
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().setSp(12),
                          ),
                        ),
                        Text(
                          UserDetails().email,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF7277F1),
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().setSp(12),
                          ),
                        ),
                      ]),
                    ),
                  )
//

                  ),
              SizedBox(
                height: 24.h,
              ),
              LongButton(
                useIcon: true,
                title: "My Programs",
                onPressed: () {
                  Navigator.pushNamed(context, '/myprograms');
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              LongButton(
                useIcon: true,
                title: "My Questions",
                onPressed: () {
                  Navigator.pushNamed(context, '/myquestions');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
