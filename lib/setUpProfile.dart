// import 'dart:html';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';




class SetUpProfilePage extends StatefulWidget {
  @override
  
  _SetUpProfilePageState createState() => _SetUpProfilePageState();
}

class _SetUpProfilePageState extends State<SetUpProfilePage> {

   
  File sampleImage;
  String imageUrl;

  TextEditingController _nameController = new TextEditingController();
    TextEditingController _usernameController = new TextEditingController();


    setUpProfile(String name,String username)async{
      String imageName=UserDetails().uid+'.jpg';
        final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('Avatar/$imageName');
      StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
    StorageTaskSnapshot snapshotTask =  await task.onComplete;
    String downloadUrl = await snapshotTask.ref.getDownloadURL();

     UserUpdateInfo updateUser=UserUpdateInfo();
     updateUser.displayName=name;
     UserDetails().user.updateProfile(updateUser);
     Firestore.instance.collection('users').document(UserDetails().uid).updateData({'name':name,'username':username,'profilepicurl':downloadUrl});
    UserDetails().name=name;
        UserDetails().username=username;
    UserDetails().profilepic=downloadUrl;
Navigator.pushReplacementNamed(context, '/home');

     }
Future <void> _optionsDialogBox(){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Take a Picture',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  ),
                  onTap: getImageCam,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                  GestureDetector(
                  child: Text('Choose from Gallery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  ),
                  onTap: getImageGal,
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Future getImageCam() async {
     var tempImage = await ImagePicker().getImage(source: ImageSource.camera);


    setState(() {
      sampleImage = File (tempImage.path);
      // imageUrl='uploaded';
    });
  
  }

  Future getImageGal() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
       sampleImage = File (tempImage.path);
            // imageUrl='uploaded';

    });
  }
   void initState() {
     imageUrl=UserDetails().profilepic;
    super.initState();
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
                      backgroundImage:sampleImage==null? AssetImage('images/avatar.png'):FileImage(sampleImage),
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
                      child: IconButton(
                        onPressed:(){
                        _optionsDialogBox();
                        } ,
                        icon: Icon(Icons.add, color: Colors.blue, size: 27)),
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
                controller: _usernameController,
                cursorColor: Colors.white,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 45),
                    hintText: 'user name',
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
                child: RaisedButton(
      padding: EdgeInsets.fromLTRB(40, 7, 40, 7),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(36))),
      onPressed: () {
        setUpProfile(
          _nameController.text,
          _usernameController.text
        );
       
      },
      child: Text('Setup profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Color(0xFF7277F1),
            fontSize: 19,
          )),
    )
                
                ),
          ],
        ),
      ),
    );
  }
}