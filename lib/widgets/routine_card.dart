import 'package:dia/view_model/new_diary_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';

class RoutineCard extends StatelessWidget {
  RoutineCard(
      {super.key,
      required this.size,
      required this.backgroundImage,
      required this.textColor,
      required this.routineText,
      required this.index});

  final Size size;
  String backgroundImage;
  Color textColor;
  String routineText;
  int index;

  @override
  Widget build(BuildContext context) {
    final cardViewModel = Provider.of<TopicsContainerProivder>(context);
    return InkWell(
      onTap: () {
        cardViewModel.changeTopicColor(index);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 250),
          height: cardViewModel.selectedIndex == index
              ? size.height / 3.75
              : size.height / 4,
          width: size.width / 2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: cardViewModel.selectedIndex == index ? 0.89 : 0.65,
                  fit: BoxFit.cover,
                  image: AssetImage(backgroundImage)),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 0.2, color: CustomColors.primaryPurple),
              boxShadow: const [
                BoxShadow(
                    color: CustomColors.primaryPurple,
                    blurRadius: 0.1,
                    spreadRadius: 0.5,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Align(
            alignment: cardViewModel.selectedIndex == index
                ? Alignment.center
                : AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: cardViewModel.selectedIndex == index ||
                      cardViewModel.selectedIndex == -1
                  ? Text(routineText,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: textColor))
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
