import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/languages.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/widgets.dart';
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
      widgets.add(Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 328.w,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF7277F1),
                  borderRadius: BorderRadius.circular(8.0)),
              child: RadioListTile(
                  value: lang,
                  activeColor: Colors.white,
                  groupValue: selectedLang,
                  title: Text(
                    lang.langName,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: ScreenUtil().setSp(14)),
                  ),
                  selected: selectedLang == lang,
                  onChanged: (currentLang) {
                    setSelectedLang(currentLang);
                  }),
            ),
          ),
        ],
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
 
    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "Post Your Program",
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                InputBox(
                  hintText: 'Enter program title',
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide a program title';
                    }
                  },
                  onSaved: (input) => _programTitle = input,
                ),
                SizedBoxPadding(),
                InputBox(
                  hintText: 'Enter description',
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Provide description';
                    }
                  },
                  onSaved: (input) => _programDescription = input,
                ),
                SizedBoxPadding(),
                InputBox(
                  hintText: 'Enter your program',
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Enter a valid program';
                    }
                  },
                  onSaved: (input) => _program = input,
                ),
                SizedBoxPadding(),
                InputBox(
                  hintText: "Enter program's input",
                  validator: (input) {},
                  onSaved: (input) => _programInput = input,
                ),
                SizedBoxPadding(),
                InputBox(
                  hintText: "Enter Program's output",
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Enter a valid program';
                    }
                  },
                  onSaved: (input) => _programOutput = input,
                ),
                SizedBoxPadding(),
                InputBox(
                  hintText: 'Enter Youtube link',
                  onSaved: (input) => _programYoutube = input,
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigatioBar: ExpandableNotifier(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpandableButton(
              child: Container(
                color: Colors.white,
                height: 48.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            currentLang,
                            style: GoogleFonts.poppins(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color(0xFF7277F1),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 4.w,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF7277F1),
                            size: ScreenUtil().setSp(24),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    SizedBox(
                      width: 88.w,
                      height: 48.h,
                      child: Container(
                        color: Color(0xFF7277F1),
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          disabledColor: Color(0xFF7277F1),
                          color: Color(0xFF7277F1),
                          onPressed: postProgram,
                          child: FittedBox(
                            child: Text(
                              'Post',
                              style: GoogleFonts.poppins(
                                  fontSize: ScreenUtil().setSp(18),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expandable(
              expanded: SizedBox(
                height: 320.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: createaRadioListPrograms(),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
