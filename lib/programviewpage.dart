import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramView extends StatefulWidget {
  final DocumentSnapshot document;
  ProgramView({Key key, @required this.document}) : super(key: key);
  @override
  _ProgramViewState createState() => _ProgramViewState(this.document);
}

class _ProgramViewState extends State<ProgramView> {
  final DocumentSnapshot document;
  _ProgramViewState(this.document);

  bool star = false;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      showError('assets/images/iconImg/sad_face.png',
          "YouTube url insn't provided", context);
    }
  }

  int _currentLikes = 0;

  void initState() {
    super.initState();
    setState(() {
      _currentLikes = document['likes'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "Program",
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  TitleAndDescriptionBox(
                    avatar: FittedSmallAvatar(
                      image: NetworkImage(document['avatar_link']),
                    ),
                    username: document['username'],
                    programOrQuestion: '  last updated on',
                    date: document['creation_date'].toDate().toString(),
                    titleContent: document['title'],
                    descriptionContent: document['description'],
                    button1: TagButton(
                      name: "Run",
                      onPressed: () {
                        final data = ClipboardData(
                          text: document['program'],
                        );
                        Clipboard.setData(data);
                        codeCopiedToPlay(context);
                      },
                    ),
                    button2: TagButton(
                      name: "YouTube",
                      onPressed: () {
                        _launchInBrowser(document['youtube']);
                      },
                    ),
                    button3: TagButton(
                      name: "Comments",
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                      right: 16.w,
                    child: SizedBox(
                      width: 24.w,
                      height: 56.h,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              onPressed: () {
                                print('i got clicked');
                                int currentLikes = 0;
                                star
                                    ? Firestore.instance.runTransaction(
                                        (transaction) async {
                                          DocumentSnapshot freshSnap =
                                              await transaction
                                                  .get(document.reference);
                                          await transaction.update(
                                            freshSnap.reference,
                                            {
                                              'likes': freshSnap['likes'] - 1,
                                            },
                                          );
                                          currentLikes = freshSnap['likes'] - 1;
                                        },
                                      ).then((value) => setState(() {
                                          print("inside - 1 () ");
                                          _currentLikes = currentLikes;
                                        }))
                                    : Firestore.instance.runTransaction(
                                        (transaction) async {
                                          DocumentSnapshot freshSnap =
                                              await transaction
                                                  .get(document.reference);
                                          await transaction.update(
                                            freshSnap.reference,
                                            {
                                              'likes': freshSnap['likes'] + 1,
                                            },
                                          );
                                          currentLikes = freshSnap['likes'] + 1;
                                        },
                                      ).then(
                                        (value) => setState(
                                          () {
                                            print("inside + 1 () ");
                                            _currentLikes = currentLikes;
                                          },
                                        ),
                                      );
                                star
                                    ? setState(() {
                                        star = false;
                                      })
                                    : setState(() {
                                        star = true;
                                      });
                              },
                              icon: Icon(
                                star
                                    ? MaterialCommunityIcons.star
                                    : MaterialCommunityIcons.star_outline,
                                color: star
                                    ? Color(0xffffa800)
                                    : Color(0xffffa800).withOpacity(0.5),
                                size: ScreenUtil().setSp(24),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 6.h,
                            right: 0.w,
                            child: Text(
                              _currentLikes.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: ScreenUtil().setSp(10),
                                color: star
                                    ? Color(0xffffa800)
                                    : Color(0xffffa800).withOpacity(0.5),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBoxPadding(),
              CodeBox(
                program: document['program'],
              ),
              SizedBoxPadding(),
              InputOrOutputBox(
                title: "Output",
                content: document['output'],
              ),
              SizedBoxPadding(),
              InputOrOutputBox(
                title: "Input",
                content: document['input'],
              ),
              SizedBoxPadding(),
            ],
          ),
        ),
      ),
    );
  }
}
