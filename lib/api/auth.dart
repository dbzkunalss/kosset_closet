
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:kosset_closet/models/user_model.dart';

class AuthService {
  User kossetuser = User();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User toCustomUser(FirebaseUser user){
    return user != null ? User(email: user.email, uid: user.uid) : null;
  }

  Stream<FirebaseUser> get authStream{
    return _auth.onAuthStateChanged;
  }

  Future createUser({String email, String password}) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInUser({String email, String password}) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future logout() async {
    try{
     await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

}