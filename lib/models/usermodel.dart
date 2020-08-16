import 'package:firebase_auth/firebase_auth.dart';

class UserDetails{
  static String _name;
  static String _username;
  static String _email;
  static String _uid;
   static String _profilepic;
   static FirebaseUser _user;

   updateUser(String name,String username,String email,String uid,String profilepic,FirebaseUser user){
     _name=name;
     _username=username;
     _email=email;
     _uid=uid;
     _profilepic=profilepic;
     _user=user;
print(_name);
print(_username);
print(_email);
print(_uid);
print(_profilepic);

     
   }
logout(){
  _name=null;
  _username=null;
  _email=null;
  _uid=null;
  _profilepic=null;
  _user=null;
}
get name=>_name;
get username=>_username;
get email=>_email;
get uid=>_uid;
get profilepic=>_profilepic;
get user=>_user;
set name(String name){_name=name;}
set username(String username){_username=username;}
set email(String email){_email=email;}
set uid(String uid){_uid=uid;}
set profilepic(String profilepic){_profilepic=profilepic;}
}