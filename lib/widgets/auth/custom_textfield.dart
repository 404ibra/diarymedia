import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.kTextFieldPadding,
      child: TextField(
        cursorColor: CustomColors.primaryGrey,
        decoration: InputDecoration(
          enabledBorder: CustomInputDecoration.authDecoration,
          focusedBorder: CustomInputDecoration.authDecoration,
          hintText: "mail".tr(),
          focusColor: CustomColors.primaryGrey,
        ),
      ),
    );
  }
}
