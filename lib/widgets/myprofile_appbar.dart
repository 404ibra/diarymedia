import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/profile_headline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constants.dart';
import '../views/home_page.dart';

class MyProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyProfileAppBar({
    super.key,
    required this.profileVM,
  });

  final ProfileViewModel profileVM;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 50,
      backgroundColor: Color(0xffffafcfe),
      leading: IconButton(
          onPressed: () {
            Get.to(() => const HomePage(), transition: Transition.fadeIn);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: CustomColors.profilePrimaryColor,
          )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileHeadline(
            ontap: () {
              profileVM.changeSelectedIndex(0);
            },
            headlineText: "Rutinler",
            profileVM: profileVM,
            index: 0,
          ),
          ProfileHeadline(
              ontap: () {
                profileVM.changeSelectedIndex(1);
              },
              headlineText: "Takvim",
              profileVM: profileVM,
              index: 1)
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: CustomColors.profilePrimaryColor,
            )),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
