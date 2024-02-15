import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                pro.signOutWithEmail();
                pro.googleSignOut();
              },
              child: Text("signout"))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset("assets/Animation - 1707713244831.json",
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello",
                style: GoogleFonts.adventPro(
                    fontSize: 25, fontWeight: FontWeight.w900),
              ),
              Text(
                "Welcome To Ecommerce App.",
                style: GoogleFonts.alegreyaSc(
                    fontSize: 20, fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onTap: () {
                    // loging(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Sign Up",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 57, 16, 220)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  onTap: () {
                    // loging(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Login",
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color.fromARGB(255, 57, 16, 220),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const SizedBox(width: 130),
                  GestureDetector(
                    onTap: () {
                      pro.gitHubSignIn(context);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/git1-removebg-preview.png"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      pro.googleSignIn();
                    },
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/google1-removebg-preview.png"
                          // fit: BoxFit.cover,
                          // filterQuality: FilterQuality.high,
                          ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      pro.getOtp(pro.phoneController.text);
                    },
                    child: SizedBox(
                        height: 40,
                        width: 40,
                        child:
                            Image.asset("assets/phone1-removebg-preview.png")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
