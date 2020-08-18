// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/programviewpage.dart';
import 'package:hashinclude/widget.dart';
import 'package:expandable/expandable.dart';

class Programs extends StatefulWidget {
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore db = Firestore.instance;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
    super.initState();
  }

  checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }

  int _index = 0;
  int i;
  bool fieldTouch = false;

  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ThemeColor().returnColor())),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Card(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )),
                      child: Container(
                        child: TextField(
                          autofocus: false,
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5254D8),
                              ),
                              hintText: 'Search Programs',
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF5254D8),
                              ),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 8)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF5254D8),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(8),
                  children: <Widget>[
                    ExpandablePanel(
                      initialExpanded: true,
                      hasIcon: false,
                      header: Container(
                        child: Row(
                          children: <Widget>[
                            Text('Programming Language',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Colors.white)),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
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
                                  padding: const EdgeInsets.all(7.0),
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
                    Container(
                      child: Text('Programs',
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.59,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: StreamBuilder(
                          stream: db
                              .collection('programs')
                              .orderBy('creation_date', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProgramView(
                                            document:
                                                snapshot.data.documents[index],
                                          )));
                                },
                                child: CustomCard(
                                  title: snapshot.data.documents[index]
                                      ['title'],
                                  language: snapshot.data.documents[index]
                                      ['language'],
                                  username: snapshot.data.documents[index]
                                      ['username'],
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

// ListView.builder(
//                           itemCount: 100,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Column(
//                               children: <Widget>[
//                                 CustomCard(
//                                   text: '1. Matrix Addition',
//                                 )
//                               ],
//                             );
//                           }),
