import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[
          Padding(
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
          )
        ],
      ),
    );
  }
}
