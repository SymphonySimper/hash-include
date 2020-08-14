import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class PlayGround extends StatefulWidget {
  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 64,
                    ),
                    child: Text(
                      'Play Ground',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 31,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.save,
                        size: 34,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 370,
                height: 480,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: TextFormField(
                    maxLines: 80,
                    decoration: InputDecoration(
                      hintText: 'enter your code',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 308,
                top: 55,
              ),
              child: RaisedButton(
                  padding: EdgeInsets.only(left: 1, bottom: 7, right: 0),
                  color: Color(0xFF7277F1),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildAboutDialog(context),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 19),
                        child: Text(
                          'Run',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 48.0, top: 3),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text(' Input:'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'this is the output screen',
        ),
        FlatButton(
          onPressed: () {},
          child: Text('Submit'),
        )
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
      ),
    ],
  );
}
