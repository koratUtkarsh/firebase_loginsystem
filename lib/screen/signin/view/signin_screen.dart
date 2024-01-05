import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contriller/login_controller.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: txtemail,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  label: const Text("E-mail"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TextField(
                controller: txtpassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                loginController.loginSystemController(email: txtemail.text, password: txtpassword.text);
                Get.snackbar("Succrss", "SignIn");
                Get.toNamed('/home');
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('/signup');
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
