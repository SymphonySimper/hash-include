import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/programviewpage.dart';
import 'package:hashinclude/widgets/widgets.dart';

class MyPrograms extends StatefulWidget {
  @override
  _MyProgramsState createState() => _MyProgramsState();
}

class _MyProgramsState extends State<MyPrograms> {
  @override
  Widget build(BuildContext context) {

    return BackgroundBox(
      appBar: TransparentAppBar(
        title: 'My Programs',
      ),
      child: Column(
        children: <Widget>[
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
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProgramView(
                                      document: snapshot.data.documents[index],
                                    )));
                          },
                          child: ProgramCard(
                            title: snapshot.data.documents[index]['title'],
                            language: snapshot.data.documents[index]
                                ['language'],
                            username: snapshot.data.documents[index]
                                ['username'],
                          ),
                        );
                      });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
