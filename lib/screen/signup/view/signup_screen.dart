import 'package:firebase_loginsystem/screen/contriller/login_controller.dart';
import 'package:firebase_loginsystem/utils/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("SignUp"),
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
                 await loginController.signUpSystemController(
                    email: txtemail.text, password: txtpassword.text);
                  FirebaseHelper.helper.checkUser();

                print("------------------------------ ${FirebaseHelper.helper.user}");
                if (FirebaseHelper.helper.user == null) {
                  Get.snackbar("Failed", "SignUp");
                }else
                {
                  Get.snackbar("Success", "SignUp");
                  Get.back();
                }
              },
              child: const Text("SignUp"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Already Login Account"),
            ),
          ],
        ),
      ),
    );
  }
}
