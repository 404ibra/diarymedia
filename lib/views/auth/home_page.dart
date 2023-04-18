import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavBar(),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
