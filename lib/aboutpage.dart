// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class About extends StatefulWidget {
//   @override
//   _AboutState createState() => _AboutState();
// }

// class _AboutState extends State<About> {
//     int _selectedItemIndex = 0;
  
  
//     List<Widget> items = [
//       Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: AssetImage(
//                   'images/ashik.jpg',
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.0,
//                     child: Text(
//                       'Haja Ashik',
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.5,
//                     child: Text(
//                       "Hi I'm Ashik, I'm the senior developer in the team.Bow before me",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: AssetImage(
//                   'images/prag.jpg',
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.0,
//                     child: Text(
//                       'Pragati',
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.5,
//                     child: Text(
//                       "Hi I'm Pragati, Front-end Developer",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: AssetImage(
//                   'images/sharanya.jpg',
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.0,
//                     child: Text(
//                       'Sharanya',
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.5,
//                     child: Text(
//                       "Hi I'm sharanya, I'm the web desinger for this app",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: AssetImage(
//                   'images/senthil.jpg',
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.0,
//                     child: Text(
//                       'senthil balaji',
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.5,
//                     child: Text(
//                       "Hi I'm senthil balaji I'm the designer for this app",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: EdgeInsets.all(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: <Widget>[
//               CircleAvatar(
//                 radius: 80,
//                 backgroundImage: AssetImage(
//                   'images/sanghavigupta.jpg',
//                 ),
//               ),
//               SizedBox(
//                 width: 16,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.0,
//                     child: Text(
//                       'Sanghavi',
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3.5,
//                     child: Text(
//                       "Hi I'm Sanghavi, ABOUT IS LOADING...... ",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: Color(0xFF333333),
//                             fontWeight: FontWeight.w400,
//                             fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ];
//     @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//               colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             )),
//           ),
//           ListWheelScrollView(
//             perspective: 0.01,
//             itemExtent: 250,

//             children: items,
// //              useMagnifier: true,

//             offAxisFraction: -0.5,

//             physics: BouncingScrollPhysics(),

//             diameterRatio: 8,

//             squeeze: 0.6,

//             onSelectedItemChanged: (index) => {
//               setState(() {
//                 _selectedItemIndex = index;
//               })
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }