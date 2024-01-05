import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_loginsystem/utils/firebase_helper.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Future<void> loginSystemController(
      {required email, required password}) async {
    await FirebaseHelper.helper
        .firebaseSignIn(email: email, password: password);
  }

  Future<void> signUpSystemController(
      {required email, required password}) async {
   await FirebaseHelper.helper
        .firebaseSignUp(email: email, password: password);
  }

}
