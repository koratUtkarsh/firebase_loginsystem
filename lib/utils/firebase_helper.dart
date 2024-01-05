import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirebaseHelper {
  static final helper = FirebaseHelper._();
  User? user;
  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> firebaseSignUp({required email, required password}) async {
    try {
      UserCredential crd = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
    catch (e) {

    }
  }

  Future<String> firebaseSignIn({required email, required password}) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => "Success")
        .catchError((e) => "Failed");
  }

  Future<void> firebaseLogout() async {
    await firebaseAuth.signOut().then((value) => Get.offAndToNamed('/'),);
  }


  // Future<String?> signInWithGoogle() async {
  //   String? msg;
  //
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //   final GoogleSignInAuthentication? googleAuth =
  //   await googleUser?.authentication;
  //
  //
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   await FirebaseAuth.instance
  //       .signInWithCredential(credential)
  //       .then((value) => msg = "Success")
  //       .catchError((e) => msg = "$e");
  //   return msg;
  // }
  void checkUser()
  {
    user = firebaseAuth.currentUser;
  }
}
