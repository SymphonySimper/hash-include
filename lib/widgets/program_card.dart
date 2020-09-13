import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgramCard extends StatefulWidget {
  final String title;
  final String language;
  final String username;
  ProgramCard({@required this.title, this.language, this.username});
  @override
  _ProgramCardState createState() =>
      _ProgramCardState(this.title, this.language, this.username);
}

class _ProgramCardState extends State<ProgramCard> {
  final String title;
  final String language;
  final String username;
  _ProgramCardState(this.title, this.language, this.username);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: SizedBox(
        width: 328.w,
        height: 76.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          SizedBox(
            width: 328.w,
            height: 68.h,
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.h),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.12),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 298.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      title: Text(
                        this.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      subtitle: Text(
                        'by ' + username,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      trailing: SizedBox(
                        width: 30.w,
                        child: Icon(
                          Icons.chevron_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: Theme.of(context).iconTheme.size,
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          Positioned(
            top: 0,
            left: 4.w,
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
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(17.h),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.65),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(2, 4), // changes position of shadow
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
        ]),
      ),
    );
  }
}
