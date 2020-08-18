import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class OrLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 1,
          color: Color(0xFFC4C4C4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Text(
            'or',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Container(
            width: 100,
            height: 1,
            color: Color(0xFFC4C4C4),
          ),
        ),
      ],
    );
  }
}

class GoogleButton extends StatefulWidget {
  final String nav;
  GoogleButton({@required this.nav});
  @override
  _GoogleButtonState createState() => _GoogleButtonState(this.nav);
}

class _GoogleButtonState extends State<GoogleButton> {
  final String nav;
  _GoogleButtonState(this.nav);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // padding: const EdgeInsets.only(top: 60),
        child: Center(
//                    padding: EdgeInsets.fromLTRB(170, 80, 10, 20),
            child: RaisedButton(
          padding: EdgeInsets.fromLTRB(30, 11, 30, 11),
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(36))),
          onPressed: () {
            // signIn(
            //     _emailController.text, _passwordController.text);
            Navigator.pushReplacementNamed(context, nav);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 26.0),
            child: Text('Sign in with Google',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7277F1),
                  fontSize: 17,
                )),
          ),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 106, top: 13),
        // child: Text('this')
        child: Image(
          height: 20,
          width: 20,
          image: AssetImage(
            'images/Google_image.png',
          ),
        ),
      )
    ]);
  }
}

class ThemeColor {
  bool isDarkTheme = false;
  List<Color> returnColor() {
    if (isDarkTheme) {
    } else {
      return [Color(0xFFCD37FF), Color(0xFF40C9FF)];
    }
  }
}

class CustomCard extends StatefulWidget {
  final String title;
  final String language;
  final String username;
  CustomCard({@required this.title, this.language, this.username});
  @override
  _CustomCardState createState() =>
      _CustomCardState(this.title, this.language, this.username);
}

class _CustomCardState extends State<CustomCard> {
  final String title;
  final String language;
  final String username;
  _CustomCardState(this.title, this.language, this.username);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.035;
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(left: size, right: size, top: 30),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(top: 7),
            height: 80,
            // color: Colors.white,
            child: ListTile(
              title: Text(
                this.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color:
                      //Colors.blue,
                      Color(0xFF394AA3),
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xFF394A33),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 6.0, top: 4),
                child: Text(
                  'by ' + username,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(left: 22, bottom: 5, top: 18),
        child: FittedBox(
          fit: BoxFit.none,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 40),
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              height: 20,

              decoration: BoxDecoration(
                color: Color(0xFF7277F1),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              // color: Color(0xFF394AA3),
              child: Text(
                language,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class AvatarColor extends StatefulWidget {
  final double radius;
  final double colorradius;
  AvatarColor({@required this.radius, this.colorradius});
  @override
  _AvatarColorState createState() =>
      _AvatarColorState(this.radius, this.colorradius);
}

class _AvatarColorState extends State<AvatarColor> {
  final double radius;
  final double colorradius;
  _AvatarColorState(this.radius, this.colorradius);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: colorradius,
      backgroundColor: Color(0xFF7277F1),
      child: CircleAvatar(
        //  backgroundColor: Colors.blueAccent,
        backgroundImage: AssetImage('images/avatar.png'),

        radius: this.radius,
      ),
    );
  }
}

class Headingg extends StatelessWidget {
  final String text;
  Headingg({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }
}
showError(String errorMessage,BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
class QueCard extends StatefulWidget {
  @override
  _QueCardState createState() => _QueCardState();
}

class _QueCardState extends State<QueCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.91111,
          height: MediaQuery.of(context).size.height * 0.20937,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: MediaQuery.of(context).size.height * 0.196875,
                  child: Row(
                    children: [
                      SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.55555,
                        // height: MediaQuery.of(context).size.height * 0.196875,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 0, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.53333,
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typeLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF333333),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.00625,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width:
                                    MediaQuery.of(context).size.width * 0.53333,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 32 / 32,
                                      child: Avatar(radius: 32),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01111,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Posted by Shrek2020",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xFF333333),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00625,
                                        ),
                                        Text(
                                          "Feb 14 at 5:30pm",
                                          style: GoogleFonts.poppins(
                                            color: Color(0xFF333333),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35555,
                          height: MediaQuery.of(context).size.height * 0.196875,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 22, 8, 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://itcraftapps.com/wp-content/uploads/2020/04/Apps-in-Flutter.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.1166,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          height: MediaQuery.of(context).size.height * 0.025,
                          decoration: BoxDecoration(
                            color: Color(0xFFF74C06),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFF74C06).withOpacity(0.65),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset:
                                    Offset(2, 4), // changes position of shadow
                              ),
                            ],
                          ),

                          // color: Color(0xFF394AA3),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Icon(
                                  MaterialCommunityIcons.fire,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.0111),
                                Text(
                                  '153',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.1166,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          height: MediaQuery.of(context).size.height * 0.025,
                          decoration: BoxDecoration(
                            color: Color(0xFF7277F1),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF7277F1).withOpacity(0.65),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset:
                                    Offset(2, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          // color: Color(0xFF394AA3),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'C++',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}

Widget questionCard(BuildContext context,String title,String language,String username,String pictureurl,Timestamp date) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    child: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            title,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                child: Image.network(pictureurl)
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RichText(
                                 overflow: TextOverflow.clip,
                                text: TextSpan(
                                  text: 'posted by '+username,
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(text: '\n'+date.toDate().toString(),
                                   
                                    
                                   
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: double.maxFinite,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://itcraftapps.com/wp-content/uploads/2020/04/Apps-in-Flutter.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0.1,
          right: 25,
          child: Row(children: [
            Card(
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                child: Row(
                  children: [
                    Icon(
                      MaterialCommunityIcons.fire,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.0111),
                    Text(
                      '153',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                child: Text(
                  language,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

class Notific extends StatefulWidget {
  final String nav;
  Notific({@required this.nav});
  @override
  _NotificState createState() => _NotificState(this.nav);
}

class _NotificState extends State<Notific> {
  final String nav;
  _NotificState(this.nav);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(40))),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, nav);
          },
          icon: Icon(
            Icons.notifications,
            color: Color(0xFF7277F1),
            size: 27,
          ),
        )
      ],
    );
  }
}

class Avatar extends StatefulWidget {
  final double radius;
  Avatar({@required this.radius});
  @override
  _AvatarState createState() => _AvatarState(this.radius);
}

class _AvatarState extends State<Avatar> {
  final double radius;
  _AvatarState(this.radius);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //  backgroundColor: Colors.blueAccent,
      backgroundImage: AssetImage('images/avatar.png'),

      radius: this.radius,
    );
  }
}

class MyProgCard extends StatefulWidget {
  final String text;
  MyProgCard({@required this.text});
  @override
  _MyProgCardState createState() => _MyProgCardState(this.text);
}

class _MyProgCardState extends State<MyProgCard> {
  final String text;
  _MyProgCardState(this.text);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.0245,
          MediaQuery.of(context).size.width * 0.05744,
          MediaQuery.of(context).size.width * 0.0432,
          MediaQuery.of(context).size.width * 0,
        ),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(top: 7),
            height: MediaQuery.of(context).size.width * 0.1999,
            // color: Colors.white,
            child: ListTile(
              title: Text(
                this.text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color:
                      //Colors.blue,
                      Color(0xFF394AA3),
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Color(0xFF394A33),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(left: 6.0, top: 4),
                child: Text(
                  'By Sowmya AM, CSE',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
      ),
      Row(children: [
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 5, top: 18),
          child: Container(
            padding: EdgeInsets.only(left: 9, top: 0),
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFF7277F1),
              //            boxShadow:BoxShadow(
              //              color: Color(0xFF7277F1)
              //            ),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            // color: Color(0xFF394AA3),
            child: Text(
              'C++',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 8, 0),
          child: FittedBox(
            fit: BoxFit.none,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.1166,
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                height: MediaQuery.of(context).size.height * 0.025,
                decoration: BoxDecoration(
                  color: Color(0xFF7277F1),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7277F1).withOpacity(0.65),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(2, 4), // changes position of shadow
                    ),
                  ],
                ),
                // color: Color(0xFF394AA3),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'private',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ])
    ]);
  }
}

class NotificationsCard extends StatefulWidget {
  final String text;
  NotificationsCard({@required this.text});
  @override
  _NotificationsCardState createState() => _NotificationsCardState(this.text);
}

class _NotificationsCardState extends State<NotificationsCard> {
  final String text;
  _NotificationsCardState(this.text);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
//          color: Color(0xFF828282),
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
      leading:
//      Icon(MaterialIcons.getIconData("message")),
          Icon(Icons.message,
              size: 29,
              color: Color(
                0xFFA1A4F1,
              )),
      trailing: Text(
        '3d',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Color(0xFFBDBDBD),
          fontSize: 16,
        ),
      ),
    );
  }
}
