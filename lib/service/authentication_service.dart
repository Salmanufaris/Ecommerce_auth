import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAutService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String collection = 'userpo';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential> signUpwithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');
      return userCredential;
    } on FirebaseAuthMultiFactorException catch (e) {
      throw Exception(e.code);
    }
  }
}
