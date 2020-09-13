import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/sizedbox_padding.dart';

inputPop(TextEditingController controller, Function onPressed,
    BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: SizedBox(
          width: 296.w,
          height: 243.h,
          child: Stack(
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
                          "Input",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(14),
                            color: Color(0xff7277F1),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Ignore this if your program dosen’t need any input",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: ScreenUtil().setSp(10),
                            color: Color(0xff828282),
                          ),
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: TextField(
                            autofocus: false,
                            textAlignVertical: TextAlignVertical.center,
                            style: GoogleFonts.sourceCodePro(
                              fontWeight: FontWeight.w400,
                              fontSize: ScreenUtil().setSp(14),
                              color: Color(0xff333333),
                            ),
                            controller: controller,
                            cursorColor:
                                Theme.of(context).colorScheme.onPrimary,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              enabledBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .enabledBorder,
                              focusedBorder: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder,
                              contentPadding: EdgeInsets.only(top: 16.h),
                              hintText:
                                  'Split multiple inputs into separate lines',
                              hintStyle: Theme.of(context)
                                  .inputDecorationTheme
                                  .hintStyle
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: ScreenUtil().setSp(10),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                    size: ScreenUtil().setSp(20),
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.35),
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
