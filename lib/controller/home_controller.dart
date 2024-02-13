import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/authentication_service.dart';

class AuthProvider extends ChangeNotifier {
  final EmailPasswordAutService emailPasswordAutService =
      EmailPasswordAutService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    return await emailPasswordAutService.signUpwithEmail(email, password);
  }
}
