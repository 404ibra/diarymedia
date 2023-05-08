import 'dart:io';

import 'package:dia/constant/constants.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 30,
        backgroundColor: Color(0xffffafcfe),
      ),
      backgroundColor: Color(0xfffedf3fa),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.52,
              decoration: const BoxDecoration(
                  color: Color(0xffffafcfe),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: CustomPaddings.kHorizontalPadding,
                    child: Text(
                      "Profilim",
                      style: TextStyles.profileMainStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 17.0),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage("assets/images/wash_face_img.png"),
                          ),
                        ),
                        Text(
                          "Jeniffer Gryhandell",
                          style: TextStyles.profileMainStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 50),
                          child: Text(
                            "Reder, Fitness, Nutrion",
                            style: TextStyle(
                                color: Color(0xfffafb8cb),
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: CustomPaddings.kHorizontalPadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ProfileDetailsRFF(
                                headline: "Rutinler",
                                number: "4",
                              ),
                              ProfileDetailsRFF(
                                headline: "Takipler",
                                number: "124",
                              ),
                              ProfileDetailsRFF(
                                headline: "Takipçi",
                                number: "3213",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//RFF Mean is Routine Follower Follows
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
