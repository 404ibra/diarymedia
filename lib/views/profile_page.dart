import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/views/home_page.dart';
import 'package:dia/widgets/profile_information_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
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
            onPressed: () {
              print(FirebaseAuth.instance.currentUser!.uid);
              Get.to(() => const HomePage(), transition: Transition.fadeIn);
            },
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
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseCurrentUserService.uid)
                      .snapshots(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userSnapshot.data == null) {
                      print("usersnapshot is null");
                    } else if (userSnapshot.data!.data() == null) {
                      print("userssnapshot.data.data is null");
                    }
                    final _userRoutineList =
                        userSnapshot.data!.data()!['routines'];

                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: _userRoutineList.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Routines")
                                    .doc(_userRoutineList[index])
                                    .snapshots(),
                                builder: (context, routineSnapshots) {
                                  if (routineSnapshots.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (routineSnapshots.data == null) {
                                    print("routineSnapshots is null");
                                  } else if (routineSnapshots.data!.data() ==
                                      null) {
                                    print("routinesnapshot.data.data is null");
                                  }
                                  final _routineContent =
                                      routineSnapshots.data!.data()!.length;
                                  print("bismillah");
                                  print(_routineContent);
                                  return SizedBox(
                                    height: 300,
                                    child: MasonryGridView.count(
                                        crossAxisCount: 2,
                                        itemCount: _userRoutineList.length,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4,
                                        itemBuilder: (context, index) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                                "_routineContent"),
                                          );
                                        }),
                                  );
                                });
                          }),
                    );
                  },
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
