import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_textstyles.dart';
import 'package:dia/service/firebase_auth_service.dart';
import 'package:dia/view_model/sign_in_checkbox.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});
  @override
  Widget build(BuildContext context) {
    double isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom;
    final signInProvider = Provider.of<SignInCheckbox>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isKeyboardOpen > 0
                ? AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: CustomPaddings.kHorizontalPadding,
                      child: Text(
                        "signInHeadline".tr(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : isKeyboardOpen <= 0
                    ? Padding(
                        padding: CustomPaddings.kHorizontalPadding,
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: MediaQuery.of(context).size.width,
                            height: isKeyboardOpen >= 0
                                ? MediaQuery.of(context).size.height / 2
                                : 0,
                            child: Image.asset(
                              "assets/images/sign-in.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 1,
                      ),
            Padding(
              padding: CustomPaddings.kHorizontalPadding,
              child: Text("signInDescriptionText".tr(),
                  style:
                      TextStyle(color: CustomColors.primaryGrey, fontSize: 15)),
            ),
            UserInputs.signInMail,
            UserInputs.signInPassword,
            UserInputs.signInPasswordAgain,
            const SizedBox(height: 15),
            Padding(
              padding: CustomPaddings.kHorizontalPadding,
              child: Row(
                children: [
                  Checkbox(
                      activeColor: CustomColors.primaryGreen,
                      value: signInProvider.checkboxStatus,
                      onChanged: (value) {
                        signInProvider.changeCheckboxStatus();
                      }),
                  const SizedBox(width: 5),
                  Text(
                    "Kullanıcı sözleşmesini okudum ve kabul ediyorum",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.brown.shade300,
                        decorationThickness: 1.7,
                        color: Colors.brown.shade300),
                  )
                ],
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    FirebaseFunctions().signInWithMail(
                        UserInputs.signInMail.controller.text,
                        UserInputs.signInPassword.controller.text,
                        UserInputs.signInPasswordAgain.controller.text);
                  },
                  child: Text(
                    "registerText".tr(),
                    style: TextStyles.kTextStylePrimaryGreen
                        .copyWith(fontSize: 21, fontWeight: FontWeight.bold),
                  )),
            ),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "youHaveAlreadyAccount".tr(),
                    style: TextStyles.kTextStylePrimaryGrey),
                TextSpan(
                    text: "loginText".tr(),
                    style: TextStyles.kTextStylePrimaryGreen
                        .copyWith(fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ])),
            )
          ],
        ),
      ),
    );
  }
}
