import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/API/apicalls.dart';
import 'package:hashinclude/languages.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 String _questionTitle,_questionDescription,_program;
 postQuestion(){
   if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_questionTitle);
      print(_questionDescription);
      print(_program);
   
    try {
      Firestore.instance.collection('questions').add({
      'avatar_link':UserDetails().profilepic,
      'creation_date':DateTime.now(),
      'title':_questionTitle,
      'description':_questionDescription,
      'program':_program,
     'language':'Java',
      'uid':UserDetails().uid,
      'username':UserDetails().username,
      'popularity':1,
      });
       Navigator.of(context).pop();
    } catch (e) {
    }
   }
 }
 TextEditingController _codeController = new TextEditingController();
  TextEditingController _inputController = new TextEditingController();
  String currentLang = "C#";
  String currentLangCode = "csharp";
  int currentLangVI = 3;

  Lang selectedLang;
  List<Lang> langs = [];

  ProgressDialog pr;

  bool isPublic = false;

  @override
  void initState() {
    super.initState();
    langs = Lang.getLang();
    for (Lang lang in langs) {
      if (lang.langName == "C#") {
        setSelectedLang(lang);
      }
    }
  }

  setSelectedLang(Lang lang) {
    setState(() {
      selectedLang = lang;
      currentLang = selectedLang.langName;
      currentLangCode = selectedLang.language;
      currentLangVI = selectedLang.maxVersion;
    });
  }

  List<Widget> createaRadioListPrograms() {
    List<Widget> widgets = [];
    for (Lang lang in langs) {
      widgets.add(SizedBox(
        width: MediaQuery.of(context).size.width * 0.97,
        height: 60,
        child: Card(
          color: Color(0xFF7277F1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: RadioListTile(
              value: lang,
              activeColor: Colors.white,
              groupValue: selectedLang,
              title: Text(
                lang.langName,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              ),
              selected: selectedLang == lang,
              onChanged: (currentLang) {
                setSelectedLang(currentLang);
              }),
        ),
      ));
    }
    return widgets;
  }

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
                  child: ListView(children: [
            Column(children: <Widget>[
                Center(
                  heightFactor: 1.3,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
//                centerTitle: true,
                    title: Padding(
           padding: EdgeInsets.only(
             right:MediaQuery.of(context).size.width*0.03,
           ),
            child:Text('Post your Question',
                    style: GoogleFonts.poppins(
                      fontSize:
                          MediaQuery.of(context).size.width >= 411.00 ? 30 : 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),),
                    leading: IconButton(
                      onPressed: () {
            Navigator.pop(context);
                      },
                      icon: Icon(
            Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 50,
                //   child:Card(
                //     color:Colors.black,
                //   )
                // ),
                Card(
                  color: Colors.white,
                  child: TextFormField(
                         decoration:InputDecoration(
                           hintText: 
                      " Enter Program title ",
                      hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.black,
                      ),
                    
                         ),
                  minLines: 1,
                  maxLengthEnforced: true,
                    validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a program title ';
                
                  } 
                
                  
                },
                 onSaved: (input) => _questionTitle= input,
                  maxLines: 10,
                      )
                ),
                Card(
                  color: Colors.white,
                  child: TextFormField(
                         decoration:InputDecoration(
                           hintText: 
                      " Enter Program description ",
                      hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.black,
                      ),
                    
                         ),
                  minLines: 1,
                  maxLengthEnforced: true,
                    validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a Program description ';
                
                  } 
                
                  
                },
                 onSaved: (input) => _questionDescription= input,
                  maxLines: 10,
                      )
                ),
                Card(
                  color: Colors.white,
                  child:

                    
                    
                       TextFormField(
                         decoration:InputDecoration(
                           hintText: 
                      " Enter your Program ",
                      hintStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.black,
                      ),
                    
                         ),
                  minLines: 1,
                  maxLengthEnforced: true,
                    validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a valid program ';
                
                  } 
                
                  
                },
                 onSaved: (input) => _program= input,
                  maxLines: 10,
                      )
                   
                ),
              
              ] 
                  ),
          ]),
        ),
      ),
    bottomSheet: SolidBottomSheet(
        toggleVisibilityOnTap: true,
        headerBar: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(currentLang,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: Color(0xFF5254D8),
                          )),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF5254D8),
                      )
                    ],
                  )),
              FlatButton(
                padding:
                    EdgeInsets.only(left: 25, right: 15, top: 15, bottom: 10),
                disabledColor: Color(0xFF7277F1),
                color: Color(0xFF7277F1),
                onPressed:
                  postQuestion,
               
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'post',
                      style: GoogleFonts.poppins(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 35,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: createaRadioListPrograms(),
            ),
          ),
        ),
      ),
    );
  }
}