import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class ProfileHeadline extends StatelessWidget {
  ProfileHeadline(
      {super.key,
      required this.ontap,
      required this.headlineText,
      this.profileVM,
      this.homePageVM,
      required this.index,
      required this.type});

  void Function()? ontap;
  String headlineText;
  final ProfileViewModel? profileVM;
  final HomePageViewModel? homePageVM;

  String type;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(seconds: 200),
        padding: const EdgeInsets.only(bottom: 3),
        decoration: type == "MyProfile"
            ? (profileVM!.profileSelectedIndex == index
                ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0, // This would be the width of the underline
                  )))
                : null)
            : (homePageVM!.selectedIndex == index
                ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0, // This would be the width of the underline
                  )))
                : null),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 200),
          style: TextStyles.profileMainStyle.copyWith(
              fontSize: 18,
              color: type == "MyProfile"
                  ? (profileVM!.profileSelectedIndex == index
                      ? CustomColors.profilePrimaryColor
                      : CustomColors.profileSecondoryColor)
                  : (homePageVM!.selectedIndex == index
                      ? CustomColors.profilePrimaryColor
                      : CustomColors.profileSecondoryColor)),
          child: Text(headlineText),
        ),
      ),
    );
  }
}
