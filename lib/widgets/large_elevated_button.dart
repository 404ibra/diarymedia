import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class LargeElevatedButton extends StatelessWidget {
  LargeElevatedButton(
      {super.key, required this.buttonText, required this.onPressed});

  String buttonText;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPaddings.kVerticalPadding,
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.075,
          width: MediaQuery.of(context).size.width * 0.88,
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      CustomColors.primaryPurple)),
              onPressed: onPressed,
              child:
                  Text(buttonText, style: TextStyles.largeElevatedButtonText)),
        ),
      ),
    );
  }
}
