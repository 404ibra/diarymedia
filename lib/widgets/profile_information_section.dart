import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/profile_details_rff.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';

class ProfileInformationSection extends StatelessWidget {
  ProfileInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 1200),
      curve: Curves.ease,
      height: profileVM.currentHeight,
      decoration: const BoxDecoration(
          color: Color(0xffffafcfe),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: profileVM.animatedStarted == false
          ? Column(
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
            )
          : null,
    );
  }
}
