import 'package:dia/view_model/user_inputs.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 120),
          UserInputs.signInMail,
          UserInputs.signInPassword,
          UserInputs.signInPasswordAgain
        ],
      ),
    );
  }
}
