import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/languages.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:hashinclude/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddQuestion extends StatefulWidget {
  final DocumentSnapshot document;

  const AddQuestion({Key key, this.document}) : super(key: key);
  @override
  _AddQuestionState createState() => _AddQuestionState(this.document);
}

class _AddQuestionState extends State<AddQuestion> {
  final DocumentSnapshot document;

  File sampleImage;
  String downloadUrl;
  Asset tempDownload;
  File tempImag;
  String abc;
  
   
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _questionTitle, _questionDescription, _program,questionid;

  _AddQuestionState(this.document);
  postQuestion() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_questionTitle);
      print(_questionDescription);
      print(_program);

      try {
        await Firestore.instance.collection('questions').add({
          'avatar_link': UserDetails().profilepic,
          'creation_date': DateTime.now(),
          'title': _questionTitle,
          'description': _questionDescription,
          'program': _program,
          'language': currentLang,
          'uid': UserDetails().uid,
          'username': UserDetails().username,
          'popularity': 1,
        }).then((value) => {
            questionid  = value.documentID,
             
             
              print(
                  "Jahan :::::::::::::::::::::::::::::::: " +questionid),
                  
            });

        // Navigator.of(context).pop();
      } catch (e) {}

      print('i was called here');
        print(sampleImage);
        // String imageName = UserDetails().uid + '.jpg';
        // final StorageReference firebaseStorageRef =
        //     FirebaseStorage.instance.ref().child('Avatar/$imageName');
        // StorageUploadTask task = firebaseStorageRef.putFile(tempImag);
        // StorageTaskSnapshot snapshotTask = await task.onComplete;
        // downloadUrl = await snapshotTask.ref.getDownloadURL();
        // print(downloadUrl);

      print("hello therereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");

      await Firestore.instance.collection('screenshots').add({
        'avatar_link': UserDetails().profilepic,
        'screenshots':UserDetails().name ,
        'creation_date': DateTime.now(),
        'userName': UserDetails().username,
        'questionId': questionid
      }).then((value) => 
        print(
                  "Ashi :::::::::::::::::::::::::::::::: " + value.documentID),
      );
    }
  }



  // Future getImageCam() async {
  //   var tempImage = await ImagePicker().getImage(source: ImageSource.camera);

  //   setState(() {
  //     sampleImage = File(tempImage.path);
  //     Navigator.pop(context);
  //     // imageUrl='uploaded';
  //   });
  // }

  // Future getImageGal() async {
  //   var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

  //   setState(() {
  //     sampleImage = File(tempImage.path);
  //     Navigator.pop(context);
  //     // imageUrl='uploaded';
  //   });
  // }




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

  List<Asset> images = List<Asset>();

  String _error = 'No Error Dectected';
  

  Widget  buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
         tempDownload=asset;
          abc=tempDownload.toString();
File imageFile = File(abc);
tempImag=imageFile;
    //  Future getImageGal() async {
    // var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

    // setState(() {
    //   sampleImage = File(tempImage.path);
    //   Navigator.pop(context);
    //   // imageUrl='uploaded';
    // });
  // }



        return AssetThumb(
          asset: asset,
         
          width: 300,
          height: 300,
          
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(UserDetails().uid + 'hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    // print(tempDownload.toString() + 'temp image');
    // print(questionid+ "hey");
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
              FlatButton(
                onPressed: loadAssets,
                child: Text(
                  "click me",
                ),
              ),
              // buildGridView(),

              FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: 484.h, minHeight: 162.h),
                            child: SizedBox(
                              width: 296.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.h),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 16.h,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: buildGridView(),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: FlatButton(
                                          child: Text(
                                            'Okay',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: ScreenUtil().setSp(14),
                                              color: Color(0xff7277F1),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Text("for pop up"),
              )
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

////////////////////////

// Widget err(BuildContext context){

//      }
