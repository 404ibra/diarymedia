import 'package:dia/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class ProfileHeadline extends StatelessWidget {
  ProfileHeadline(
      {super.key,
      required this.ontap,
      required this.headlineText,
      required this.profileVM,
      required this.index});

  void Function()? ontap;
  String headlineText;
  final ProfileViewModel profileVM;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 200),
        padding: const EdgeInsets.only(bottom: 3),
        decoration: profileVM.profileSelectedIndex == index
            ? const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                color: Colors.black,
                width: 2.0, // This would be the width of the underline
              )))
            : null,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 200),
          style: TextStyles.profileMainStyle.copyWith(
            fontSize: 18,
            color: profileVM.profileSelectedIndex == index
                ? CustomColors.profilePrimaryColor
                : CustomColors.profileSecondoryColor,
          ),
          child: Text(headlineText),
        ),
      ),
    );
  }
}
