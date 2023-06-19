import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/questionviewpage.dart';
import 'package:hashinclude/widgets/widgets.dart';

class MyQuestions extends StatefulWidget {
  @override
  _MyQuestionsState createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  String _dropDownValue;
  Firestore db = Firestore.instance;
  @override
  Widget build(BuildContext context) {

    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "My Questions",
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('questions')
                    .orderBy('creation_date', descending: true)
                    .where('uid', isEqualTo: UserDetails().uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child:Text('u havent added any questions'),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => QuestionView(
                                      document: snapshot.data.documents[index],
                                    )));
                          },
                          child: QueCard(
                            question: snapshot.data.documents[index]['title'],
                            username: snapshot.data.documents[index]
                                ['username'],
                            avatar: NetworkImage(
                                snapshot.data.documents[index]['avatar_link']),
                            language: snapshot.data.documents[index]
                                ['language'],
                            date: snapshot.data.documents[index]
                                ['creation_date'],
                            likes: snapshot.data.documents[index]['popularity'],
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
