import 'package:flutter/material.dart';
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