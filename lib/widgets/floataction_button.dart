import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const NewDiary(), transition: Transition.fadeIn);
      },
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/23.png"),
      ),
    );
  }
}
