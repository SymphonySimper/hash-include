import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';




class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   bool isSwitched = false;
   FirebaseAuth _auth=FirebaseAuth.instance;
     checkAuthentication() {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        UserDetails().logout();
      Navigator.of(context).pop();
       Navigator.pushReplacementNamed(context, '/intro');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
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
                title: Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              ),

              SizedBox(height: 26,),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white,),
                width: MediaQuery.of(context).size.width * 0.91111,
                height: MediaQuery.of(context).size.height*0.09625,
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text('Dark Mode',style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
                ),
                  Padding(
                    padding: EdgeInsets.only(

                      right: MediaQuery.of(context).size.width * 0.00044444,
                    ),
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched=value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.blue,
                      activeColor: Colors.blue,
                    ),
                  )

                ],),

              ),
              SizedBox(height: 24,

              ),
              GestureDetector(
                onTap:(){ Navigator.pushNamed(context, '/about');
                     },     child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white,),
                  width: MediaQuery.of(context).size.width * 0.91111,
                   height: MediaQuery.of(context).size.height*0.09625,
                  
                  padding: const EdgeInsets.only(left: 16,top:15),
                    child: Text('About',style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,

                  )),

                ),
              ),
            
            Center(
              // heightFactor: 10,
              child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(36))),
                          onPressed:
                          (){
                          _auth.signOut();
                          },

                          
                          child: Text('signout',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF7277F1),
                                fontSize: 19,
                              )),
                        ),
            ),

            ],
          ),
        ),

      );
  }
}