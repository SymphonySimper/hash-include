import 'dart:async';
import 'dart:io';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hashinclude/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class SetupProfilePage extends StatefulWidget {
  @override
  _SetupProfilePageState createState() => _SetupProfilePageState();
}

class _SetupProfilePageState extends State<SetupProfilePage> {
  File sampleImage;
  String downloadUrl;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  setUpProfile(String name, String username) async {
    if (sampleImage != null) {
      print('i was dalled here');
      print(sampleImage);
      String imageName = UserDetails().uid + '.jpg';
      final StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('Avatar/$imageName');
      StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
      StorageTaskSnapshot snapshotTask = await task.onComplete;
      downloadUrl = await snapshotTask.ref.getDownloadURL();
    } else {
      downloadUrl =
          "https://firebasestorage.googleapis.com/v0/b/hash-include-d92a5.appspot.com/o/Avatar%2Fq6oXh4ide4cmQKPEYx9EwV5c83n1.jpg?alt=media&token=fc6b625d-0029-4326-88a0-0801fe531eff";
    }

    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = name;
    UserDetails().user.updateProfile(updateUser);
    Firestore.instance
        .collection('users')
        .document(UserDetails().uid)
        .updateData(
            {'name': name, 'username': username, 'profilepicurl': downloadUrl});
    UserDetails().name = name;
    UserDetails().username = username;
    UserDetails().profilepic = downloadUrl;
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
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
                    child: Text(
                      'Choose from Gallery',
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
        });
  }

  Future getImageCam() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      sampleImage = File(tempImage.path);
      // imageUrl='uploaded';
    });
  }

  Future getImageGal() async {
    var tempImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = File(tempImage.path);
      // imageUrl='uploaded';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundBox(
      resizeToAvoidBottomInset: false,
      appBar: TransparentAppBar(
        title: "Setup Profile",
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: <Widget>[
            SizedBoxPadding(),
            AvatarWithIcon(
              width: 120.w,
              height: 120.h,
              iconHeight: 24.h,
              iconWidth: 24.w,
              icon: Icons.add,
              whiteIcon: false,
              iconOnPressed: () {
                addImage(getImageCam, getImageGal, context);
              },
              avatar: sampleImage == null
                  ? AssetImage('assets/images/avatar.png')
                  : FileImage(sampleImage),
            ),
            SizedBoxPadding(),
            TextFieldColoured(
              hintText: 'username',
              obscureText: false,
              isWhite: true,
              controller: _nameController,
            ),
            SizedBoxPadding(),
            TextFieldColoured(
              hintText: 'username',
              obscureText: false,
              isWhite: true,
              controller: _usernameController,
            ),
            SizedBoxPadding(),
            SolidSmallButton(
              title: 'Sign up',
              onPressed: () {
                setUpProfile(_nameController.text, _usernameController.text);
              },
              isWhite: false,
            ),
          ],
        ),
      ),
    );
  }
}
