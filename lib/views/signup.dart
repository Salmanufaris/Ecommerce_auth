import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 230,
                ),
                Row(children: [
                  Text(
                    "Sign",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                MaterialButton(
                    textColor: Colors.white,
                    child: Text("Login"),
                    color: Colors.black,
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
