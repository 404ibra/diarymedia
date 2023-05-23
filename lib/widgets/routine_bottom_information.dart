import 'package:flutter/material.dart';

import '../constant/constants.dart';

class RoutineBottomInformation extends StatelessWidget {
  const RoutineBottomInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 35,
      width: size.width / 2,
      color: Colors.white60,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10),
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage:
                        AssetImage("assets/images/wash_face_img.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "@ibra",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "88.Gün",
                      style: TextStyle(
                          color: CustomColors.profilePrimaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.favorite_outline_outlined,
                  color: CustomColors.primaryPurple,
                  size: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0, left: 4),
                  child: Text(
                    "14",
                    style: TextStyle(
                        color: CustomColors.profilePrimaryColor, fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
