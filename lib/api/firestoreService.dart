import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class FirestoreService{

  FirestoreService({this.uid});

  final String uid;
  final CollectionReference users = Firestore.instance.collection('users');

  Future createUser(Box<dynamic> box) async {
    return await users.document(uid).setData({
      'uid':box.get('uid'),
      'email':box.get('email'),
      'name':box.get('name'),
      'last_date':box.get('last_date'),
      'days':box.get('days'),
    });    
  }
}