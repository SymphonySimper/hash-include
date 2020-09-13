import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/languages.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _questionTitle, _questionDescription, _program;
  postQuestion() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_questionTitle);
      print(_questionDescription);
      print(_program);

      try {
        Firestore.instance.collection('questions').add({
          'avatar_link': UserDetails().profilepic,
          'creation_date': DateTime.now(),
          'title': _questionTitle,
          'description': _questionDescription,
          'program': _program,
          'language': currentLang,
          'uid': UserDetails().uid,
          'username': UserDetails().username,
          'popularity': 1,
        });
        Navigator.of(context).pop();
      } catch (e) {}
    }
  }

  // TextEditingController _codeController = new TextEditingController();
  // TextEditingController _inputController = new TextEditingController();
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
        title: "Post Your Question",
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: <Widget>[
              SizedBox(
                height: 24.h,
              ),
              InputBox(
                hintText: 'Enter program title',
                validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a program title ';
                  }
                },
                onSaved: (input) => _questionTitle = input,
              ),
              SizedBoxPadding(),
              InputBox(
                hintText: "Enter Program description",
                validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a Program description ';
                  }
                },
                onSaved: (input) => _questionDescription = input,
              ),
              SizedBoxPadding(),
              InputBox(
                hintText: "Enter your Program",
                validator: (input) {
                  if (input.isEmpty) {
                    print(input);
                    return 'Provide a valid program ';
                  }
                },
                onSaved: (input) => _program = input,
              ),
              SizedBoxPadding(),
            ]),
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
                          onPressed: postQuestion,
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
