import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/fitted_small_avatar.dart';

class QueCard extends StatefulWidget {
  final String question, language, username;
  final NetworkImage avatar;
  final Timestamp date;
  final int likes;

  const QueCard(
      {Key key,
      this.question,
      this.language,
      this.username,
      this.avatar,
      this.date,
      this.likes})
      : super(key: key);

  @override
  _QueCardState createState() => _QueCardState(this.question, this.language,
      this.username, this.avatar, this.date, this.likes);
}

class _QueCardState extends State<QueCard> {
  final String question, language, username;
  final NetworkImage avatar;
  final Timestamp date;
  final int likes;

  _QueCardState(this.question, this.language, this.username, this.avatar,
      this.date, this.likes);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width: 328.w,
          height: 134.h,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.h),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(2, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 126.h,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 10.h),
                    child: SizedBox(
                      height: 108.h,
                      width: 312.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 192.w,
                            height: 108.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 192.w,
                                    child: Text(
                                      question,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF333333),
                                        fontWeight: FontWeight.w400,
                                        fontSize: ScreenUtil().setSp(12),
                                        height: 1.5.h,
                                      ),
                                    )),
                                SizedBox(
                                  height: 4.h,
                                ),
                                SizedBox(
                                  height: 32.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 32.h,
                                        width: 32.w,
                                        child: FittedSmallAvatar(
                                          image: avatar,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      FittedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Posted by ' + username,
                                              style: GoogleFonts.poppins(
                                                color: Color(0xFF333333),
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    ScreenUtil().setSp(10),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              date.toDate().toString(),
                                              style: GoogleFonts.poppins(
                                                color: Color(0xFF333333),
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    ScreenUtil().setSp(10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 104.w,
                                height: 88.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.h),
                                  child: Image.network(
                                    'https://itcraftapps.com/wp-content/uploads/2020/04/Apps-in-Flutter.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 8.h, 0),
                      child: FittedBox(
                        fit: BoxFit.none,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 42.w,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(4.w, 0, 8.w, 0),
                            height: 17.h,
                            decoration: BoxDecoration(
                              color: Color(0xFFF74C06),
                              borderRadius: BorderRadius.circular(17.h),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFF74C06).withOpacity(0.65),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 4), // changes position of shadow
                                ),
                              ],
                            ),

                            // color: Color(0xFF394AA3),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    MaterialCommunityIcons.fire,
                                    color: Colors.white,
                                    size: 13.h,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    likes.toString(),
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
                      child: FittedBox(
                        fit: BoxFit.none,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 42.w,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                            height: 17.h,
                            decoration: BoxDecoration(
                              color: Color(0xFF7277F1),
                              borderRadius: BorderRadius.circular(17.h),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF7277F1).withOpacity(0.65),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            // color: Color(0xFF394AA3),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                language,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
