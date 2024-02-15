import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_controller.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 230,
                ),
                const Row(children: [
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: pro.emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: pro.passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                    textColor: Colors.white,
                    child: const Text("Login"),
                    color: Colors.black,
                    onPressed: () {
                      pro.signUpWithEmail(pro.emailController.text,
                          pro.passwordController.text);
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
