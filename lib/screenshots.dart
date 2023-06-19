import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  final String questionId;

  const Screen({Key key, this.questionId}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState(this.questionId);
}

class _ScreenState extends State<Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String questionId;
  Firestore db = Firestore.instance;
  _ScreenState(this.questionId);

  @override
  Widget build(BuildContext context) {
    print(questionId + '      ' + 'howww');
    print(this.questionId + '      ' + 'howww');

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
          child: Column(
        children: [
          Text('hello'),
          Expanded(
            child: StreamBuilder(
              stream: db
                  .collection('screenshots')
                  .where('questionId', isEqualTo: this.questionId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa " + snapshot.hasData.toString());
                  // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa " + snapshot.data[0]);
                  // print(snapshot.data.documents[0]['userName'] + 'hello there');
                  return Center(
                    child: Text('nopppppppppppppppppppp'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) =>
                          Text(snapshot.data.documents[index]['userName']));
                }
                //  print(snapshot.data.documents['userName'] + 'hello there');
              },
            ),
          )
        ],
      )),
    );
  }
}
