import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/user_inputs.dart';
import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const NewDiary(), transition: Transition.fadeIn);
          },
          backgroundColor: CustomColors.primaryPurple,
          child: const Text(
            "+",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          )),
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
                  Container(
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
                      border: Border.all(
                          width: 1, color: CustomColors.primaryPurple),
                      color: Colors.white,
                    ),
                    child: const Center(child: Text("Düzenle")),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: const <Widget>[
                      Text(
                        "Takipçi:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("404")
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      Text(
                        "Takip Edilen:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text("88")
                    ],
                  ),
                ],
              ),
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
