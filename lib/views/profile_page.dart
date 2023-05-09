import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/profile_information_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileVM = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Color(0xffffafcfe),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: CustomColors.profilePrimaryColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: CustomColors.profilePrimaryColor,
              )),
        ],
      ),
      backgroundColor: Color(0xfffedf3fa),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels > 60) {
            profileVM.changeInformationHeight(0, true);
          } else if (notification.metrics.pixels < -60) {
            profileVM.changeInformationHeight(350, false);
          }
          return true;
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileInformationSection(),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.48,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, -1))
                          ],
                          image: const DecorationImage(
                              opacity: 0.75,
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/wash_face_img.png"))),
                    ),
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.240,
                          width: size.width * 0.4,
                          color: Colors.green,
                        ),
                        Container(
                          height: size.height * 0.240,
                          width: size.width * 0.4,
                          color: Colors.pink,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.240,
                  width: size.width,
                  color: Colors.orangeAccent,
                ),
                Container(
                  height: size.height * 0.240,
                  width: size.width,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScrollTextUnderline extends StatelessWidget {
  const ScrollTextUnderline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3, // Space between underline and text
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: CustomColors.profileSecondoryColor,
        width: 1.0, // Underline thickness
      ))),
      child: const Text(
        "Rutinler",
        style: TextStyle(
            color: CustomColors.profilePrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
