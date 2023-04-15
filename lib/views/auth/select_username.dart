import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateUsername extends StatelessWidget {
  const CreateUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: CustomPaddings.kHorizontalPadding,
              child: Text(
                "letsStart".tr(),
                style: TextStyles.kHeadlineTextStyle,
              ),
            ),
            UserInputs.userName
          ],
        ),
      ),
    );
  }
}
