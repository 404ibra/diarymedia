import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/model/user_model.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/auth/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/auth/user_create_initial_profile.dart';

class FirebaseFunctions {
  Future<void> signInWithMail(String email, String password,
      String passwordAgain, bool acceptAgreement) async {
    if (password == passwordAgain) {
      if (acceptAgreement == true) {
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
        print("Kullanıcı sözleşmeyi kabul etmemiş");
      }
    } else {
      print("Şifreler eşleşmiyor");
    }
  }

  Future<void> createUserDetails(
      String gender,
      bool userAnonymousBirthday,
      DateTime userBirthday,
      String userProfilePhotoPath,
      BuildContext context) async {
    try {
      const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primaryPurple),
        strokeWidth: 3,
      );
      final userDetails = UserModel(
          userEmail: FirebaseAuthService.AuthService.currentUser!.email,
          userName: UserInputs.firstName.controller.text,
          userUsername: UserInputs.userName.controller.text,
          userGender: gender,
          userBirthday: userBirthday.toString(),
          userBirthdayAnonymous: userAnonymousBirthday,
          userProfileImageUrl: userProfilePhotoPath);
      await FirebaseFirestore.instance
          .collection(FirebaseRef.FirebaseUsers)
          .doc(FirebaseAuthService.AuthService.currentUser!.uid)
          .set(userDetails.toJson())
          .then((value) => Get.to(() => const HomePage()));
    } catch (err) {
      print("User Register Error : $err");
    }
  }
}
