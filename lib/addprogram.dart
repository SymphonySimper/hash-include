import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/languages.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widget.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProgram extends StatefulWidget {
  @override
  _AddProgramState createState() => _AddProgramState();
}

class _AddProgramState extends State<AddProgram> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _programTitle,
      _programDescription,
      _program,
      _programInput,
      _programOutput,
      _programYoutube;
  postProgram() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        Firestore.instance.collection('programs').add({
          'avatar_link': UserDetails().profilepic,
          'creation_date': DateTime.now(),
          'title': _programTitle,
          'description': _programDescription,
          'program': _program,
          'input': _programInput ?? '',
          'output': _programOutput,
          'language': currentLang,
          'uid': UserDetails().uid,
          'username': UserDetails().username,
          'youtube': _programYoutube,
          'likes': 0,
        });
        Navigator.of(context).pop();
      } catch (e) {}
    }
  }

  String currentLang = "C#";
  String currentLangCode = "csharp";
  int currentLangVI = 3;
  Lang selectedLang;
  List<Lang> langs = [];

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppBar(
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
                  title: Text('Post your Program',
                    style: GoogleFonts.poppins(
                      fontSize:
                          MediaQuery.of(context).size.width >= 411.00 ? 30 : 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter program title',
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide a program title';
                          }
                        },
                        onSaved: (input) => _programTitle = input,
                        maxLines: 10,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter description',
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide description';
                          }
                        },
                        onSaved: (input) => _programDescription = input,
                        maxLines: 10,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your program',
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Enter a valid program';
                          }
                        },
                        onSaved: (input) => _program = input,
                        maxLines: 10,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter program's input",
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {},
                        onSaved: (input) => _programInput = input,
                        maxLines: 10,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Program's output",
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Enter a valid program';
                          }
                        },
                        onSaved: (input) => _programOutput = input,
                        maxLines: 10,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.044444444,
                    right: MediaQuery.of(context).size.width * 0.044444444,
                  ),
                  child: Card(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter program title',
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                        ),
                        minLines: 1,
                        maxLengthEnforced: true,
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide a program title';
                          }
                        },
                        onSaved: (input) => _programYoutube = input,
                        maxLines: 10,
                      )),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
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
                onPressed: postProgram,
                child: Text(
                  'post',
                  style: GoogleFonts.poppins(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
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
