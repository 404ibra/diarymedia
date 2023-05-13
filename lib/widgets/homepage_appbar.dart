import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/profile_headline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constants.dart';
import '../views/home_page.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBar({super.key, required this.homePageVM});

  final HomePageViewModel homePageVM;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 50,
      backgroundColor: Color(0xffffafcfe),
      leading: const Icon(
        Icons.person,
        color: CustomColors.profilePrimaryColor,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileHeadline(
            ontap: () {
              homePageVM.changeSelectedIndex(0);
            },
            headlineText: "Keşfet",
            type: "MyProilfe",
            homePageVM: homePageVM,
            index: 0,
          ),
          ProfileHeadline(
            ontap: () {
              homePageVM.changeSelectedIndex(1);
            },
            headlineText: "Anasayfa",
            type: "HomePage",
            homePageVM: homePageVM,
            index: 1,
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: CustomColors.profilePrimaryColor,
            )),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
