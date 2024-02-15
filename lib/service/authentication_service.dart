import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/autmodel.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      log('User loged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutWithEmail() async {
    await firebaseAuth.signOut();
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) {
        log('Google authentication failed');
        throw Exception('Google authentication failed');
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? guser = userCredential.user;
      log("${guser?.displayName}");

      final authenticationModel = UserAuthentication(
        email: guser?.email,
        name: guser?.displayName,
        phoneNumber: guser?.phoneNumber,
        userId: guser?.uid,
      );
      await firestore.collection(collection).doc(guser?.uid).set(
            authenticationModel.toJson(),
          );
    } catch (e) {
      print('Google Sign-In Error: $e');
      throw e;
    }
  }

  gitHubSign(context) async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    try {
      UserCredential user =
          await firebaseAuth.signInWithProvider(githubAuthProvider);
      User gituser = user.user!;
      final UserAuthentication userdata = UserAuthentication(
          phoneNumber: "",
          email: gituser.email,
          name: gituser.displayName,
          userId: gituser.uid);
      firestore.collection("users").doc(gituser.uid).set(userdata.toJson());
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  String? _verificationId;
  Future<void> getOtp(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.updatePhoneNumber(phoneAuthCredential);
          }
        },
        verificationFailed: (error) {
          log("verification failed error : $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      log("sign in error : $e");
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otp,
      );

      await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      log("verifyOTP error: $e");
    }
  }
}
