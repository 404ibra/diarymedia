import 'package:dia/constant/custom_textstyles.dart';
import 'package:dia/service/firebase_auth_service.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:flutter/gestures.dart';
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
          UserInputs.signInPasswordAgain,
          TextButton(
              onPressed: () {
                FirebaseFunctions().signInWithMail(
                    UserInputs.signInMail.controller.text,
                    UserInputs.signInPassword.controller.text,
                    UserInputs.signInPasswordAgain.controller.text);
              },
              child: Text(
                "Kayıt ol",
                style: TextStyles.kTextStylePrimaryGreen
                    .copyWith(fontSize: 21, fontWeight: FontWeight.bold),
              )),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: "Zaten bir hesabınız var mı?",
                style: TextStyles.kTextStylePrimaryGrey),
            TextSpan(
                text: " Giriş Yap",
                style: TextStyles.kTextStylePrimaryGreen
                    .copyWith(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = () {})
          ]))
        ],
      ),
    );
  }
}
