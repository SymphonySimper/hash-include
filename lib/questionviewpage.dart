import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/screenshots.dart';
import 'package:hashinclude/widgets/widgets.dart';

class QuestionView extends StatefulWidget {
  final DocumentSnapshot document;
  QuestionView({Key key, @required this.document}) : super(key: key);
  @override
  _QuestionViewState createState() => _QuestionViewState(this.document);
}

class _QuestionViewState extends State<QuestionView> {
  final DocumentSnapshot document;
  _QuestionViewState(this.document);

  String currentLang = "Java";
  bool burn = false;
  int _currentLikes = 0;

  void initState() {
    super.initState();
    setState(() {
      _currentLikes = document['popularity'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return BackgroundBox(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TransparentAppBar(
          title: "Question",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    TitleAndDescriptionBox(
                      avatar: FittedSmallAvatar(
                        image: NetworkImage(document['avatar_link']),
                      ),
                      username: document['username'],
                      programOrQuestion: '  asked on',
                      date: document['creation_date'].toDate().toString(),
                      titleContent: document['title'],
                      descriptionContent: document['description'],
                      button1: TagButton(
                        name: "Screenshots",
                      
                        onPressed:
                         () {  print("i got clicked");
                           Navigator.of(context).push(
                             
                                        MaterialPageRoute(
                                            builder: (context) => Screen(
                                                questionId: this.document.documentID)));
                        },
                      ),
                      button2: TagButton(
                        name: "Comments",
                        onPressed: () {},
                      ),
                      button3: TagButton(
                        name: "See Similar",
                        onPressed: () {
                           print("i got clicked");
                        },
                      ),
                    ),
                    Positioned(
                      right: 16.w,
                      child: SizedBox(
                        width: 24.w,
                        height: 56.h,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                onPressed: () {
                                  print('i got clicked');
                                  int currentLikes = 0;
                                  burn
                                      ? Firestore.instance.runTransaction(
                                          (transaction) async {
                                            DocumentSnapshot freshSnap =
                                                await transaction
                                                    .get(document.reference);
                                            await transaction.update(
                                              freshSnap.reference,
                                              {
                                                'popularity': freshSnap['popularity'] - 1,
                                              },
                                            );
                                            currentLikes =
                                                freshSnap['popularity'] - 1;
                                          },
                                        ).then((value) => setState(() {
                                            print("inside - 1 () ");
                                            _currentLikes = currentLikes;
                                          }))
                                      : Firestore.instance.runTransaction(
                                          (transaction) async {
                                            DocumentSnapshot freshSnap =
                                                await transaction
                                                    .get(document.reference);
                                            await transaction.update(
                                              freshSnap.reference,
                                              {
                                                'popularity': freshSnap['popularity'] + 1,
                                              },
                                            );
                                            currentLikes =
                                                freshSnap['popularity'] + 1;
                                          },
                                        ).then(
                                          (value) => setState(
                                            () {
                                              print("inside + 1 () ");
                                              _currentLikes = currentLikes;
                                            },
                                          ),
                                        );
                                  burn
                                      ? setState(() {
                                          burn = false;
                                        })
                                      : setState(() {
                                          burn = true;
                                        });
                                },
                                icon: Icon(
                                  burn
                                      ? MaterialCommunityIcons.star
                                      : MaterialCommunityIcons.star_outline,
                                  color: burn
                                      ? Color(0xffF74C06)
                                      : Color(0xffF74C06).withOpacity(0.5),
                                  size: ScreenUtil().setSp(24),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 6.h,
                              right: 0.w,
                              child: Text(
                                _currentLikes.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: ScreenUtil().setSp(10),
                                  color: burn
                                      ? Color(0xffF74C06)
                                      : Color(0xffF74C06).withOpacity(0.5),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  
                  ],
                ),
                FlatButton(child: Text("hello"),
                onPressed: (){
                Navigator.of(context).push(
                             
                                        MaterialPageRoute(
                                            builder: (context) => Screen(
                                                questionId: this.document.documentID)));
                },
                
                ),
                SizedBoxPadding(),
                CodeBox(
                  program: document['program'],
                ),
                SizedBoxPadding(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
