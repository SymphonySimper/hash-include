// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';



// Widget err(BuildContext context){
//   showDialog(
//     context: context,
//      builder: (BuildContext context) {
//       return Dialog(
        
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.h),
//         ),
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxHeight: 484.h, minHeight: 162.h),
//           child: FittedBox(
//             fit: BoxFit.contain,
//             child: SizedBox(
//               width: 296.w,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.h),
//                   color: Colors.white,
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 16.h,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 74.h,
//                         child: Image.asset(image),
//                       ),
                      
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: FlatButton(
//                           child: Text(
//                             'Okay',
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w600,
//                               fontSize: ScreenUtil().setSp(14),
//                               color: Color(0xff7277F1),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//      }
//   );
//      }