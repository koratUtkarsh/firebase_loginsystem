import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_loginsystem/firebase_options.dart';
import 'package:firebase_loginsystem/screen/homeScreen/home_screen.dart';
import 'package:firebase_loginsystem/screen/signin/view/signin_screen.dart';
import 'package:firebase_loginsystem/screen/signup/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SigninScreen(),),
        GetPage(name: '/signup', page: () => SignupScreen(),),
        GetPage(name: '/home', page: () => HomeScreen(),),
      ],
    ),
  );
}


