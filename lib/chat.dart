import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/questionviewpage.dart';
import 'package:hashinclude/widget.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String _dropDownValue;
  Firestore db = Firestore.instance;
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(children: [
//              Image.asset(
//                'images/background.png',
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height,
//              ),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
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
                              hintText: 'Search',
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
            ),

            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.35,
                left: 30,
                top: 30,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor: Color(0xFF7277F1),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 25,
                  ),
                  hint: _dropDownValue == null
                      ? Text('Dropdown')
                      : Text(_dropDownValue,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 20,
                          )),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.white),
                  items: [
                    'New',
                    'Popular',
                  ].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val;
                      },
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: db.collection('questions').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap:(){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>QuestionView(document: snapshot.data.documents[index] ,)));
                        },
                                              child: questionCard(
                            context,
                            snapshot.data.documents[index]['title'],
                            snapshot.data.documents[index]['language'],
                            snapshot.data.documents[index]['username'],
                            snapshot.data.documents[index]['avatar_link'],
                            snapshot.data.documents[index]['creation_date']
                                ),
                      ));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
