import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
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
                    loging(context);
                  },
                  textAlign: TextAlign.center, // Align the text in the center
                  decoration: InputDecoration(
                    hintText: "Login",
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color.fromARGB(
                        255, 57, 16, 220), // Set the background color to blue
                    filled: true,
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
                    loging(context);
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
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  const SizedBox(width: 130),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset("assets/git1-removebg-preview.png"
                        // fit: BoxFit.cover,
                        // filterQuality: FilterQuality.high,
                        ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/google1-removebg-preview.png"
                        // fit: BoxFit.cover,
                        // filterQuality: FilterQuality.high,
                        ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/phone1-removebg-preview.png"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loging(BuildContext context) async {
    showDialog(
      barrierColor: Colors.grey,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}
