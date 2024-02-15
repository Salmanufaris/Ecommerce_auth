import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/authentication_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final EmailPasswordAutService emailPasswordAutService =
      EmailPasswordAutService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await emailPasswordAutService.signUpwithEmail(email, password);
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    return await emailPasswordAutService.signInWithEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await emailPasswordAutService.signOutWithEmail();
  }

  Future<void> googleSignIn() async {
    await emailPasswordAutService.googleSignIn();
    notifyListeners();
  }

  Future<void> googleSignOut() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  gitHubSignIn(BuildContext context) async {
    try {
      await emailPasswordAutService.gitHubSign(context);
    } catch (e) {
      throw Exception('Exception $e');
    }
    notifyListeners();
  }

  Future<void> getOtp(phoneNumber) async {
    await emailPasswordAutService.getOtp(phoneNumber);
    notifyListeners();
  }

  Future<void> verifyOtp(otp) async {
    await emailPasswordAutService.verifyOTP(otp);
    notifyListeners();
  }
}
