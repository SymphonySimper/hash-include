import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/sizedbox_padding.dart';

savePop(TextEditingController controller, Function onPressed, bool checkValue,
    Function checkChange, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: SizedBox(
          width: 296.w,
          height: 140.h,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Save your program",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color(0xff7277F1),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextField(
                          autofocus: false,
                          textAlignVertical: TextAlignVertical.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color(0xff333333),
                          ),
                          controller: controller,
                          cursorColor: Color(0xff7277F1),
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff7277F1),
                                width: 0.0,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff7277F1),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 10.h),
                            hintText: 'Enter your program’s name',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(10),
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Make as Public',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenUtil().setSp(12),
                                color: Color(0xff7277F1),
                              ),
                            ),
                            Checkbox(
                              value: checkValue,
                              onChanged: checkChange,
                            ),
                            Spacer(),
                            FlatButton(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Color(0xff7277F1),
                                ),
                              ),
                              onPressed: onPressed,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(
                    MaterialCommunityIcons.close_circle,
                    size: ScreenUtil().setSp(24),
                    color: Color(0xff7277F1).withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
