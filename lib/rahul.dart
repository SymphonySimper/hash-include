import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListofProg extends StatefulWidget {
  @override
  _ListofProgState createState() => _ListofProgState();
}

class _ListofProgState extends State<ListofProg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text('this is the title'),
              icon: Icon(
                Icons.ac_unit,
              )),
          BottomNavigationBarItem(
              title: Text('this is the title'),
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.ac_unit,
              )),
        ],
      ),
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
              Padding(
                padding: EdgeInsets.only(
                  right: 90.0,
                  top: 55,
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
                  ),
                ),
                Container(
                  //  height: 13300,

                  child: Column(children: [
                    Stack(children: [
                      Container(
                        padding: EdgeInsets.only(left: 25, right: 20, top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          padding: EdgeInsets.only(top: 7),
                          height: 80,
                          // color: Colors.white,
                          child: ListTile(
                            onTap: () {
                              Container(
                                color: Colors.amber,
                                child: Text('hello'),
                              );
                            },
                            title: Text(
                              'this is a text',
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: Color(0xFF394A33),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(left: 6.0, top: 4),
                              child: Text(
                                'By Sowmya AM, CSE',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 5, top: 18),
                        child: Container(
                          padding: EdgeInsets.only(left: 9, top: 0),
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF394AA3),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          // color: Color(0xFF394AA3),
                          child: Text(
                            'C++',
                          ),
                        ),
                      ),
                    ]),
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
