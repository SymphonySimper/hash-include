import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

class ListofProg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hash Include',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(title: 'Hash Include'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
//  List<Image> exampleList = [
//    sem_cards / 301.png,
//  ];
//  List<int> imageList = List(3);
//  imageList[0]=1;
//  imageList[0]=1; imageList[0]=1;

//  List<Image> imagee = List<Image>(3);
// imagee[0]='301.png';
  int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                    padding: EdgeInsets.only(right: 90),
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
                  Padding(
                    padding: EdgeInsets.only(left: 340),
                    child: Container(
                      width: 47,
                      height: 47,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 340),
                    child: Notific(
                      nav: '/notification',
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(8),
                    children: <Widget>[
                      ExpandablePanel(
                        hasIcon: false,
                        header: Row(
                          children: <Widget>[
                            Text('Programming Language',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        expanded: Center(
                          child: SizedBox(
                            height: 200,
                            child: PageView.builder(
                              itemCount: 10,
                              controller: PageController(viewportFraction: 0.7),
                              onPageChanged: (int index) =>
                                  setState(() => _index = index),
                              itemBuilder: (_, i) {
                                return Transform.scale(
                                  scale: i == _index ? 1.3 : 0.8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Image.asset('sem_cards/301.png'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Programs',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: <Widget>[
                                  CustomCard(
                                    text: '1.Matrix Addition',
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Carr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('sem_cards/301.png'),
    );
  }
}

class Carrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('sem_cards/302.png'),
    );
  }
}
