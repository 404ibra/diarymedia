import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:dia/widgets/custom_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key, required this.data});

  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const NavBar(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: const Color(0xffffafcfe),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: CustomColors.profilePrimaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 8),
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage:
                      AssetImage("assets/images/wash_face_img.png"),
                ),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(data['uid'])
                      .snapshots(),
                  builder: (context, userData) {
                    if (userData.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userData.data == null) {
                      print("userdata.data is null");
                    } else if (userData.hasError) {
                      print("error var");
                    }
                    final userResponse = userData.data!.data();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1, bottom: 1.0),
                          child: Text(userResponse!['user_name'],
                              style: TextStyles.userNameUserNameStyle),
                        ),
                        Text("@${userResponse['user_username']}",
                            style: TextStyles.userNameUserNameStyle.copyWith(
                                color: CustomColors.profileSecondoryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                      ],
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
