import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widget.dart';



class MyQuestions extends StatefulWidget {
  @override
  _MyQuestionsState createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: 
      Column(children: <Widget>[



QueCard(),
QueCard(),
QueCard(),
QueCard(),  
QueCard(),
QueCard(),
QueCard(),
QueCard(),
QueCard(),
QueCard(),

      ],),),);
  }
}