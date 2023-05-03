import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:dia/widgets/custom_bordered_button.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:dia/widgets/profile_stats.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/floataction_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navBarModel = Provider.of<NavBarViewModel>(context);
    return Scaffold(
      bottomNavigationBar: NavBar(navBarModel: navBarModel, iconList: iconList),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatActionButton(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height / 6,
                      width: size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [
                            0.0,
                            .75
                          ],
                              colors: [
                            Color.fromARGB(255, 87, 81, 255),
                            CustomColors.primaryPurple,
                          ])),
                    ),
                    Container(
                      height: 20,
                      width: size.width,
                      color: Colors.white,
                    )
                  ],
                ),
                const Padding(
                  padding: CustomPaddings.kHorizontalPadding,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://xsgames.co/randomusers/assets/avatars/pixel/6.jpg")),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "İbrahim Aktaş",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      Text(
                        "@ibra",
                        style: TextStyle(
                            color: CustomColors.primaryGrey, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomBordererdButton(buttonText: "Düzenle")
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: ProfileStats(),
            ),
            const Divider(
              thickness: 1.2,
            )
          ],
        ),
      ),
    );
  }
}
