import 'package:dia/constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/auth/user_create_initial_profile.dart';

class FirebaseFunctions {
  Future<void> signInWithMail(
      String email, String password, String passwordAgain) async {
    if (password == passwordAgain) {
      try {
        await FirebaseAuthService.AuthService.createUserWithEmailAndPassword(
                email: email, password: password)
            .then((value) => Get.to(() => const CreateInitialProfile(),
                transition: Transition.fadeIn));
      } on FirebaseAuthException catch (err) {
        switch (err.code) {
          case "email-already-in-use":
            print("email kullanılıyor");
            break;
          case "invalid-email":
            print("geçersiz mail");
            break;
          case "weak-password":
            print("zayıf parola");
            break;
          default:
            print("bilinmeyen hata ${err}");
        }
      }
    } else {
      print("Şifreler eşleşmiyor");
    }
  }
}
