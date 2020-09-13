import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/questionviewpage.dart';
import 'package:hashinclude/widgets/widgets.dart';

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

    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: SearchBarAndNotification(
        controller: _searchController,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBoxPadding(),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: SizedBox(
            width: 75.w,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: Colors.white,
                elevation: 1,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: ScreenUtil().setSp(20),
                ),
                hint: _dropDownValue == null
                    ? Text('New',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(14),
                        ))
                    : Text(_dropDownValue,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(14),
                        )),
                isExpanded: true,
                iconSize: ScreenUtil().setSp(20),
                style: TextStyle(color: Color(0xFF7277F1)),
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
        ),
        Expanded(
          child: StreamBuilder(
            stream: db
                .collection('questions')
                // .orderBy('creation_date',
                //     descending: _getSortOrder(_dropDownValue))
                // .orderBy('popularity', descending: false)
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
                              builder: (context) => QuestionView(
                                    document: snapshot.data.documents[index],
                                  )));
                        },
                        child: QueCard(
                          question: snapshot.data.documents[index]['title'],
                          username: snapshot.data.documents[index]['username'],
                          avatar: NetworkImage(
                              snapshot.data.documents[index]['avatar_link']),
                          language: snapshot.data.documents[index]['language'],
                          date: snapshot.data.documents[index]['creation_date'],
                          likes: snapshot.data.documents[index]['popularity'],
                        ),
                      ));
            },
          ),
        )
      ]),
    );
  }
}

// _getSortOrder(String dropDownValue) {
//   if (dropDownValue == 'New') {
//     return true;
//   } else {
//     return false;
//   }
// }
