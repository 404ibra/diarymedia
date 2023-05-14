import 'package:dia/constant/constants.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle kTextStylePrimaryGrey =
      TextStyle(color: CustomColors.primaryGrey, fontSize: 15);
  static TextStyle kTextStylePrimaryGreen =
      TextStyle(color: CustomColors.primaryGreen, fontSize: 15);
  static const TextStyle kHeadlineTextStyle =
      TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold);
  static const TextStyle lHeadlineTextStyle =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle largeElevatedButtonText =
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600);
  static const TextStyle profileMainStyle = TextStyle(
      fontSize: 26, color: Color(0xfff455a75), fontWeight: FontWeight.bold);
  static const TextStyle rffHeadlineStyle = TextStyle(
      color: CustomColors.profileSecondoryColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5);
  static const TextStyle rffNumberStyle = TextStyle(
    color: CustomColors.profilePrimaryColor,
    fontSize: 18.5,
    fontWeight: FontWeight.bold,
  );

  static const userNameUserNameStyle = TextStyle(
      color: CustomColors.profilePrimaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500);
}
