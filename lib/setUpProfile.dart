//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

class SetupProfilePage extends StatefulWidget {
  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  TextEditingController _nameController = new TextEditingController();
//  final FirebaseAuth _auth = FirebaseAuth.instance;
  setupProfile() async {
//    UserUpdateInfo updateInfo = UserUpdateInfo();
//    updateInfo.displayName = _nameController.text;
//    _auth.onAuthStateChanged.listen((user) {
//      if (user != null) {
//        user
//            .updateProfile(updateInfo)
//            .then((value) => {Navigator.pushReplacementNamed(context, '/intro')});
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 48,
                // left: 12,
                // right: 12
                // ,bottom: 12
              ),
            ),
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.only(
                    bottom: 5,
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 90,
                ),

                //Padding(padding: EdgeInsets.only(right:80),),
                Text(
                  'Setup Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 57),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.png'),
                      radius: 73,
                    ),
                  ),
                ),
                Positioned(
                  left: 240,
                  top: 109,
                  child: ClipOval(
                    child: Container(
                      color: Colors.white,
                      height: 27,
                      width: 27,
                      child: Icon(Icons.add, color: Colors.blue, size: 27),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                controller: _nameController,
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    hintText: 'name',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                controller: _nameController,
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 45),
                    hintText: 'user id',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                  top: 40,
                  bottom: 20,
                  left: 200,
                ),
                child: Buttons(
                  text: 'Signup',
                  nav: '/intro',
                )),
//            Padding(
//              padding: EdgeInsets.only(left: 123, right: 123, top: 172),
//            ),
//            Container(
//              padding: EdgeInsets.all(10),
//              child: Text(
//                'SRI SAIRAM COLLEGE OF ENGINEERING',
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
