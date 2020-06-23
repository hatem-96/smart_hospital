import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_hospital/models/user.dart';
import 'package:smart_hospital/services/database.dart';
class AuthService {

  final FirebaseAuth _auth =FirebaseAuth.instance;
  //create user object based on firebase
  User _userFromFirebaseUser(FirebaseUser user){
    return user!=null?User(uid:user.uid):null;
  }
  //crate auth change user stream sign in or sign out
  Stream<User>get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
       // .map((FirebaseUser user)=>_userFromFirebaseUser(user)); the same= .map(_userFromFirebaseUser);
  }
// crate a function to sign in anonymous
  Future signInAnon () async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }
  //Sign In with email and password
  Future signInWithEmailAndPassword (String email, String password)async{
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email:email , password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

  }
  //Register with email and password
  Future registerWithEmailAndPassword (String email,String password)async{
try{
  AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password:password);
  FirebaseUser user=result.user;
  //create a new document for the user with the unique uid
  await DatabaseService(uid:user.uid).updateUserData('Hatem', 'Engineer', 24, 01064284946);
  return _userFromFirebaseUser(user);
}
catch(e)
{
  print(e.toString());
  return null;
}
  }
  // sign out Function
Future signOut()async{
    try {
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }

}

}