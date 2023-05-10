import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/appbar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({super.key, required this.leftTitle, required this.rightTitle});

  String leftTitle;
  String rightTitle;

  @override
  Widget build(BuildContext context) {
    final appbarVM = Provider.of<AppbarViewModel>(context);

    return SafeArea(
      child: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 0.1,
            offset: const Offset(0, .5),
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  appbarVM.changeSelectedIndex(0);
                },
                child: Text(
                  leftTitle,
                  style: TextStyle(
                    color: appbarVM.currentIndex == 0
                        ? Colors.transparent
                        : CustomColors.profileSecondoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: appbarVM.currentIndex == 0
                        ? TextDecoration.underline
                        : null,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                    shadows: appbarVM.currentIndex == 0
                        ? [
                            const Shadow(
                                color: Colors.black, offset: Offset(0, -5))
                          ]
                        : null,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  appbarVM.changeSelectedIndex(1);
                },
                child: Text(
                  rightTitle,
                  style: TextStyle(
                    color: appbarVM.currentIndex == 1
                        ? Colors.transparent
                        : CustomColors.profileSecondoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: appbarVM.currentIndex == 1
                        ? TextDecoration.underline
                        : null,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                    shadows: appbarVM.currentIndex == 1
                        ? [
                            const Shadow(
                                color: Colors.black, offset: Offset(0, -5))
                          ]
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
