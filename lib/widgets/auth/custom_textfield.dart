import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: CustomPaddings.kTextFieldPadding,
      child: TextField(
        cursorColor: CustomColors.primaryGrey,
        decoration: InputDecoration(
          enabledBorder: CustomInputDecoration.authDecoration,
          focusedBorder: CustomInputDecoration.authDecoration,
          hintText: "E-Posta",
          focusColor: CustomColors.primaryGrey,
        ),
      ),
    );
  }
}
