import 'package:dia/constant/custom_colors.dart';
import 'package:dia/constant/enums.dart';
import 'package:dia/constant/extension/icon_extension.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  NavBar({
    super.key,
  });

  Widget build(BuildContext context) {
    final navBarModel = Provider.of<NavBarViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Container(
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
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.chat_bubble_outline_outlined,
    Icons.person
  ];
}
