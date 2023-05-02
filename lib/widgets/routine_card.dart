import 'package:flutter/material.dart';

import '../constant/constants.dart';

class RoutineCard extends StatelessWidget {
  RoutineCard(
      {super.key,
      required this.size,
      required this.backgroundImage,
      required this.textColor,
      required this.routineText});

  final Size size;
  String backgroundImage;
  Color textColor;
  String routineText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height: size.height / 4,
        width: size.width / 2,
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.89,
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
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(routineText,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: textColor)),
          ),
        ),
      ),
    );
  }
}
