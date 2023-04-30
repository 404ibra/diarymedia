import 'package:dia/constant/custom_colors.dart';
import 'package:dia/constant/enums.dart';
import 'package:dia/constant/extension/icon_extension.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:dia/views/home_page.dart';
import 'package:dia/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.navBarModel,
    required this.iconList,
  });

  final NavBarViewModel navBarModel;
  final List<IconData> iconList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 10),
            spreadRadius: 10)
      ]),
      child: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        height: 75,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavbarIcon(
                  navBarModel: navBarModel,
                  iconList: iconList,
                  index: 0,
                ),
                NavbarIcon(
                    navBarModel: navBarModel, iconList: iconList, index: 1),
                const SizedBox(),
                NavbarIcon(
                    navBarModel: navBarModel, iconList: iconList, index: 2),
                NavbarIcon(
                    navBarModel: navBarModel, iconList: iconList, index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<IconData> iconList = [
  Icons.home,
  Icons.search,
  Icons.chat_bubble_outline_outlined,
  Icons.person
];

class NavbarIcon extends StatelessWidget {
  NavbarIcon({
    super.key,
    required this.navBarModel,
    required this.iconList,
    required this.index,
  });

  final NavBarViewModel navBarModel;
  final List<IconData> iconList;
  int index;
  @override
  Widget build(BuildContext context) {
    final navBarModel = Provider.of<NavBarViewModel>(context);
    return InkWell(
      onTap: () {
        navBarModel.changeIndex(index);
        if (navBarModel.selectionIndex == 0) {
          Get.to(() => const HomePage(), transition: Transition.native);
        } else if (navBarModel.selectionIndex == 3) {
          Get.to(() => const ProfilePage(), transition: Transition.native);
        }
      },
      child: Icon(
        iconList[index],
        size: 31,
        color: navBarModel.selectionIndex == index
            ? CustomColors.primaryPurple
            : CustomColors.primaryGrey,
      ),
    );
  }
}



/**
 * 
 * 

 * 
 * 
 * 
 */


/*

Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 10),
              spreadRadius: 10)
        ]),
        child: ListView.builder(
          itemCount: NavBarEnums.values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                InkWell(
                  onTap: () => navBarModel.changeIndex(index),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: 50,
                        margin: EdgeInsets.only(
                          bottom: index == navBarModel.selectionIndex
                              ? 0
                              : size.width * .029,
                          right: size.width * .0422,
                          left: size.width * .0422,
                        ),
                        height: navBarModel.selectionIndex == index ? 2 : 0,
                        decoration: const BoxDecoration(
                            color: CustomColors.primaryPurple,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(10))),
                      ),
                      Icon(
                        iconList[index],
                        size: 31,
                        color: navBarModel.selectionIndex == index
                            ? CustomColors.primaryPurple
                            : CustomColors.primaryGrey,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));



 */