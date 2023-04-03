import 'package:dia/widgets/auth/custom_textfield.dart';
import 'package:flutter/material.dart';

class UserInputs {
  static final signInMail = CustomTextField(
      obscureText: false,
      textInputType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      hint: "mail");

  static final signInPassword = CustomTextField(
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      hint: "password");

  static final signInPasswordAgain = CustomTextField(
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      hint: "passwordAgain");
}
