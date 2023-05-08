//RFF Mean is Routine Follower Follows
import 'package:flutter/material.dart';

import '../constant/constants.dart';

class ProfileDetailsRFF extends StatelessWidget {
  ProfileDetailsRFF({super.key, required this.headline, required this.number});

  String headline;
  String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(headline, style: TextStyles.rffHeadlineStyle),
        Text(number, style: TextStyles.rffNumberStyle)
      ],
    );
  }
}
