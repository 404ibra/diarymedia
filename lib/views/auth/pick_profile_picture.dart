import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class PickProfilePicture extends StatelessWidget {
  const PickProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: CustomPaddings.kHorizontalPadding,
              child: Text(
                "createInitialProfileHeadlineText".tr(),
                style: TextStyles.kHeadlineTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
