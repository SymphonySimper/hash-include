import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';

class MyPrograms extends StatefulWidget {
  @override
  _MyProgramsState createState() => _MyProgramsState();
}

class _MyProgramsState extends State<MyPrograms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Center(
              heightFactor: 1.3,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
//                centerTitle: true,
                title: Center(
                    widthFactor: 1.5, child: Headingg(text: 'My Programs')),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
            ),
            Expanded(
                          child: Container(
                child: StreamBuilder(
                  stream: Firestore.instance
                      .collection('programs')
                      .where('uid', isEqualTo: UserDetails().uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                      return  MyProgCard(
                text: snapshot.data.documents[index]['title'],
                );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
