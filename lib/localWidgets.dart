import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class Buttons extends StatefulWidget {
  final String text;
  final String nav;
  Buttons({@required this.text, this.nav});
  @override
  _ButtonsState createState() => _ButtonsState(this.text, this.nav);
}

class _ButtonsState extends State<Buttons> {
  final String text;
  final String nav;
  _ButtonsState(this.text, this.nav);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(36))),
      onPressed: () {
        // signIn(
        //     _emailController.text, _passwordController.text);
        Navigator.pushReplacementNamed(context, nav);
      },
      child: Text(text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Color(0xFF7277F1),
            fontSize: 19,
          )),
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

class CustomCard extends StatefulWidget {
  final String text;
  CustomCard({@required this.text});
  @override
  _CustomCardState createState() => _CustomCardState(this.text);
}

class _CustomCardState extends State<CustomCard> {
  final String text;
  _CustomCardState(this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Text('hell');
      },
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 25, right: 20, top: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: EdgeInsets.only(top: 7),
            height: 80,
            // color: Colors.white,
            child: ListTile(
              onTap: () {
                Container(
                  color: Colors.amber,
                  child: Text('hello'),
                );
              },
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
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 5, top: 18),
          child: Container(
            padding: EdgeInsets.only(left: 9, top: 0),
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFF394AA3),
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
      ]),
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
