// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helpers/custom_container.dart';
import 'package:flutter_application_1/helpers/helpers.dart';
import 'package:flutter_application_1/service/authentication_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  VoidCallback showLoginPage;
  SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void signUp(context) {
    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Not Match')));
    }
    AuthService().signUpWithEmail(
        emailController.text, passwordController.text, nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                  height: height * 1.5,
                  width: double.infinity,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    spacingHeight(height * 0.015),
                    Icon(
                      Iconsax.user_add,
                      color: Colors.black,
                      size: 45,
                    ),
                    spacingHeight(height * 0.020),
                    Text(
                      'Create New Account',
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    spacingHeight(height * 0.02),
                    textFormField(controller: nameController, text: 'Name'),
                    spacingHeight(height * 0.030),
                    textFormField(controller: emailController, text: 'E-mail'),
                    spacingHeight(height * 0.015),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create a strong password',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        )),
                    spacingHeight(height * 0.015),
                    textFormField(
                        controller: passwordController, text: 'Password'),
                    spacingHeight(height * 0.030),
                    textFormField(
                        controller: confirmController, text: 'Confirm'),
                    spacingHeight(height * 0.040),
                    InkWell(
                        child: Container(
                          width: double.infinity,
                          height: height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: signupGradient()),
                          child: Center(
                              child: Text(
                            'Sign Up',
                            style: GoogleFonts.workSans(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                        onTap: () {
                          signUp(context);
                        }),
                    spacingHeight(height * 0.010),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You are a mamber!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        spacingWidth(10),
                        InkWell(
                          child: Text('Login',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          onTap: () => widget.showLoginPage(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
