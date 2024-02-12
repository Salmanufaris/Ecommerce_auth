import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/authentication_service.dart';

class AuthProvider extends ChangeNotifier {
  final EmailPasswordAutService emailPasswordAutService =
      EmailPasswordAutService();
}
