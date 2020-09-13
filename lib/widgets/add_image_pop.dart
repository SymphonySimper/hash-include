import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/widgets.dart';

addImage(
    Function addFromCamera, Function addFromGallery, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: SizedBox(
          width: 296.w,
          height: 162.h,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 264.w,
                    height: 57.h,
                    child: FlatButton.icon(
                      onPressed: addFromCamera,
                      icon: Icon(
                        MaterialCommunityIcons.camera,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: Theme.of(context).iconTheme.size,
                      ),
                      label: Text(
                        "Take A photo",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(12),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBoxPadding(),
                  SizedBox(
                    width: 264.w,
                    height: 57.h,
                    child: FlatButton.icon(
                      onPressed: addFromCamera,
                      icon: Icon(
                        MaterialCommunityIcons.image_plus,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: Theme.of(context).iconTheme.size,
                      ),
                      label: Text(
                        "Choose from gallery",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(12),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
