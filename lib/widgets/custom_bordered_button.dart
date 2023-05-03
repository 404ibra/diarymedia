import 'package:flutter/material.dart';

import '../constant/constants.dart';

class CustomBordererdButton extends StatelessWidget {
  CustomBordererdButton({super.key, required this.buttonText, this.onTap});

  final String buttonText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 0.2,
              blurRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: CustomColors.primaryPurple),
          color: Colors.white,
        ),
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
