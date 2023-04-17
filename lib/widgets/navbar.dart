import 'package:dia/constant/custom_colors.dart';
import 'package:dia/constant/enums.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  Widget build(BuildContext context) {
    final navBarModel = Provider.of<NavBarViewModel>(context);
    return Container(
        height: 60,
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
            return InkWell(
              onTap: () => navBarModel.changeIndex(index),
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Column(
                      children: [
                        Container(
                          height: 2,
                          width: 30,
                          color: navBarModel.selectionIndex == index
                              ? CustomColors.primaryPurple
                              : null,
                        ),
                        Icon(
                          Icons.home,
                          color: navBarModel.selectionIndex == index
                              ? CustomColors.primaryPurple
                              : CustomColors.primaryGrey,
                          size: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  GestureDetector navBarItem(
      NavBarViewModel navBarModel, int index, IconData itemIcon) {
    return GestureDetector(
      onTap: () {
        navBarModel.changeIndex(index);
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 2,
            width: 30,
            color: navBarModel.selectionIndex == index
                ? CustomColors.primaryPurple
                : null,
          ),
          Icon(
            itemIcon,
            color: navBarModel.selectionIndex == index
                ? CustomColors.primaryPurple
                : CustomColors.primaryGrey,
          )
        ],
      ),
    );
  }
}
