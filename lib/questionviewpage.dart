import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widget.dart';

class QuestionView extends StatefulWidget {
  final DocumentSnapshot document;
  QuestionView({Key key,@required this.document}):super(key:key);
  @override
  _QuestionViewState createState() => _QuestionViewState(this.document);
}

class _QuestionViewState extends State<QuestionView> {
    final DocumentSnapshot document;
_QuestionViewState(this.document);
 
  String currentLang = "Java";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ThemeColor().returnColor())),
          ),
          SizedBox(
            height: 50,
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('i was called here');
                  Navigator.of(context).pop();
                },
              ),
              title: Align(
                alignment: Alignment(0, 0),
                child: Text(
                  'Question',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.43,
                    width: MediaQuery.of(context).size.width * 0.91111111,
                    child: Card(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                radius: 21,
                                backgroundColor: Color(0xFF7277F1),
                                child: CircleAvatar(
                                  backgroundImage:
                                     NetworkImage(document['avatar_link']),
                                  radius: 20,
                                ),
                              ),
                              title: RichText(
                                text: TextSpan(
                                    text: document['username'],
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '  asked on',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black54,
                                          )),
                                    ]),
                              ),
                              subtitle: Text(document['creation_date'].toDate().toString()),
                              trailing: Icon(
                                Icons.flash_on,
                              ),
                            ),
                            Divider(
                              color: Color(0xFF7277f1),
                              height: 3,
                            ),
                            ExpansionTile(
                           
                              title: Text('Question'),
                              children: <Widget>[
                                Text(document['title']),
                                
                                 ],
                            ),
                            ExpansionTile(
                              title: Text('Description'),
                              children: <Widget>[
                                
                                Text(document['description']),
                                ],
                            ),
                            SizedBox(
height: 46,
                            ),
                            Card(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0xff72771f1)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.0419,
                                      width: MediaQuery.of(context).size.width *
                                          0.311,
                                      child: Center(
                                        child: Text(
                                          'Screenshots',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff7277f1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0xff72771f1)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.0419,
                                      width: MediaQuery.of(context).size.width *
                                          0.311,
                                      child: Center(
                                        child: Text(
                                          'Screenshots',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff7277f1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0xff72771f1)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.0419,
                                      width: MediaQuery.of(context).size.width *
                                          0.311,
                                      child: Center(
                                        child: Text(
                                          'Screenshots',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff7277f1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0xff72771f1)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.0419,
                                      width: MediaQuery.of(context).size.width *
                                          0.311,
                                      child: Center(
                                        child: Text(
                                          'Screenshots',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff7277f1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Color(0xff72771f1)),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: MediaQuery.of(context).size.height *
                                          0.0419,
                                      width: MediaQuery.of(context).size.width *
                                          0.311,
                                      child: Center(
                                        child: Text(
                                          'Screenshots',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff7277f1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.03125),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9000111,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          // right: MediaQuery.of(context).size.width * 0.3,
                          top: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Code',
                              ),
                              Text(document['program']),
                             
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
