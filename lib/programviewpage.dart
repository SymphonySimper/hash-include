import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widget.dart';

class ProgramView extends StatefulWidget {
  final DocumentSnapshot document;
  ProgramView({Key key,@required this.document}):super(key:key);
  @override
  _ProgramViewState createState() => _ProgramViewState(this.document);
}

class _ProgramViewState extends State<ProgramView> {
  final DocumentSnapshot document;
  _ProgramViewState(this.document);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ThemeColor().returnColor(),
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.0,
                  bottom: MediaQuery.of(context).size.height * 0.025,
                  left: MediaQuery.of(context).size.width * 0.04444,
                  right: MediaQuery.of(context).size.width * 0.04444,
                ),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 27.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: Text(
                    "Program",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.53,
                  width: MediaQuery.of(context).size.width * 0.91111111,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            radius: 21,
                            backgroundColor: Color(0xFF7277F1),
                            child: CircleAvatar(
              backgroundImage: NetworkImage(document['avatar_link']),
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
                          subtitle:  Text(document['creation_date'].toDate().toString()),
                          trailing: Icon(
                            Icons.flash_on,
                          ),
                        ),
                        Divider(
                          color: Color(0xFF7277f1),
                          height: 3,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.71,
                            top: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            'Title',
                            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                          ),
                          child:Text(document['title'])
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.58,
                          ),
                          child: Text(
                            'Description:',
                            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.06),
                          child: Text(document['description'])
                        ),
                        
                      ],
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
                                'Code:',
                                style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                              ),
                              Text(document['program']),
                             
                            ],
                          ),
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
                                'Output:',
                                style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                              ),
                              Text(document['output']),
                             
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
    );
  }
}