import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/programviewpage.dart';
import 'package:expandable/expandable.dart';
import 'package:hashinclude/widgets/widgets.dart';

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

  bool programsExpanded = true;
  int _index = 0;
  int i;
  bool fieldTouch = false;

  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: SearchBarAndNotification(
        controller: _searchController,
      ),
      child: Column(
        children: <Widget>[
          SizedBoxPadding(),
          Expanded(
            child: ListView(
              children: <Widget>[
                ExpandablePanel(
                  initialExpanded: true,
                  hasIcon: false,
                  header: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 0, 16.h),
                      child: Row(
                        children: <Widget>[
                          GeneralTitleText(
                            text: 'Programming Language',
                            isWhite: true,
                          ),
                          Icon(
                            programsExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                  expanded: Center(
                    child: SizedBox(
                      height: 190.h,
                      child: PageView.builder(
                        itemCount: 10,
                        controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (_, i) {
                          return Transform.scale(
                            scale: i == _index ? 1.3 : 0.8,
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 16.h),
                              child: Container(
                                child: Image.asset(
                                    'assets/images/lang_cards/c_lang.png'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBoxPadding(),
                Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: GeneralTitleText(
                      isWhite: true,
                      text: 'Programs',
                    )),
                SizedBoxPadding(),
                SizedBox(
                  height: 435.h,
                  width: 328.w,
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProgramView(
                                  document: snapshot.data.documents[index],
                                ),
                              ),
                            );
                          },
                          child: ProgramCard(
                            title: snapshot.data.documents[index]['title'],
                            language: snapshot.data.documents[index]
                                ['language'],
                            username: snapshot.data.documents[index]
                                ['username'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
