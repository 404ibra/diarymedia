import 'package:dia/constant/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseFunctions {
  Future<void> signInWithMail(String email, String password) async {
    try {
      await FirebaseAuthService.AuthService.createUserWithEmailAndPassword(
          email: email, password: password);
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
  }
}
