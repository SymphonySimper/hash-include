import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'localWidgets.dart';

class ListofProg extends StatefulWidget {
  @override
  _ListofProgState createState() => _ListofProgState();
}

class _ListofProgState extends State<ListofProg> {
  Container Pics(String imageVal) {
    return Container(
      width: 300,
      height: 100,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(children: [
          // FittedBox(
          //   child: Image.asset('assets/background.png'),
          //   fit: BoxFit.fill,
          // ),

          Stack(
            children: <Widget>[
////////////////////divya's

// Container(
//                 height: 70,
//                 width: 400,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       focusColor: Colors.black87,
//                       prefixIcon:Padding(
//                           padding: EdgeInsets.all(10.0),
//                           child: Row(
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.only(left: 20,top:5,right:5,bottom: 10),
//                         child: Row(
//                           children: <Widget>[
//                         Center(
//                         child: Text("Search                                                        ",
//                           style: TextStyle(fontSize:15,fontStyle: FontStyle.normal,color: Colors.purpleAccent),),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5),
//                         child: Icon(Icons.search, color: Colors.purpleAccent,),
//                       )
//                                 ]),
//                               ),
//                             ],
//                           )
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                         borderSide: BorderSide(color: Colors.green,width: 2),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(color: Colors.green,width: 2),
//                       )
//                   ),
//                 )
//             ),

              Padding(
                padding: EdgeInsets.only(
                  right: 90.0, top: 55,
                  // bottom:10
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(36),
                        topRight: Radius.circular(36)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5254D8),
                      ),
                      hintText: 'Search',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF5254D8),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        top: 14,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 60,
                  left: 360,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  child: CircleAvatar(
                    //foregroundColor: Colors.red,

                    //  backgroundColor: Colors.blueAccent,
                    backgroundImage: AssetImage('images/avatar.png'),
                    radius: 22,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('clicked');
                  },
                  child: Container(
                    child: Image.asset('sem_cards/LabCardSem301.png'),
                    width: 50,
                    height: 50,
                  ),
                ),
                Container(
                  child: Image.asset('sem_cards/LabCardSem302.png'),
                  width: 0,
                  height: 50,
                ),
                Container(
                  child: Image.asset('sem_cards/LabCardSem401.png'),
                  width: 0,
                  height: 50,
                ),
                Container(
                  child: Image.asset('sem_cards/LabCardSem402.png'),
                  width: 0,
                  height: 50,
                ),
                Container(
                  child: Image.asset('sem_cards/LabCardSem501.png'),
                  width: 0,
                  height: 50,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'Programs',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  //  height: 13300,

                  child: Column(children: [
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    ),
                    CustomCard(
                      text: '1. Matrix Addition',
                    )
                  ]),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

void see() {
  Container(
    padding: EdgeInsets.only(left: 25, right: 20, top: 30),
    child: Text('hooo'),
    // Container(
    //      decoration: BoxDecoration(
    //                     color: Colors.white,

    //   borderRadius: BorderRadius.all(Radius.circular(12)),

    // ),
    //   padding: EdgeInsets.only(top:7),
    //   height: 80,
    //  // color: Colors.white,
    //   child: ListTile(
    //     onLongPress: (){
    //       //Popp();
    //     },
    //     title:  Text('thisssssssssssssssss',
    //       style: GoogleFonts.poppins(
    //         fontWeight:FontWeight.w400,
    //         fontSize: 18,
    //      color:
    //      //Colors.blue,
    //        Colors.red,
    //       ),
    //     ),
    //    trailing:Icon(Icons.chevron_right,
    //    color: Color(0xFF394A33),
    //    ),
    //     subtitle: Padding(
    //       padding:  EdgeInsets.only(left:6.0,top:4),
    //       child: Text('By Sowmya AM, CSE',
    //       style: GoogleFonts.poppins(
    //           fontWeight:FontWeight.w400,
    //           fontSize: 13,
    //        color: Colors.black,
    //         ),

    //       ),
    //     ),
    //   ),
    // ),
  );
}
