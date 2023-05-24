import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.obscureText,
      required this.textInputType,
      required this.textInputAction,
      required this.hint});

  TextEditingController controller = TextEditingController();
  TextInputType textInputType;
  TextInputAction textInputAction;
  bool obscureText;
  String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.kTextFieldPadding,
      child: TextField(
        controller: controller,
        cursorColor: CustomColors.primaryGrey,
        obscureText: obscureText,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          enabledBorder: CustomInputDecoration.authDecoration,
          focusedBorder: CustomInputDecoration.authDecoration,
          hintText: hint.tr(),
          focusColor: CustomColors.primaryGrey,
        ),
      ),
    );
  }
}
