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
                        print("usersnapshot.data() is null");
                      }
                      final responseData =
                          userSnapshot.data!.data()!['routines'];

                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: responseData.length,
                            itemBuilder: (context, index) {
                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("Routines")
                                      .where(responseData[index])
                                      .snapshots(),
                                  builder: (context, routineSnapshot) {
                                    if (routineSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (routineSnapshot.data == null) {
                                      print("routine is null");
                                    } else if (routineSnapshot.data! == null) {
                                      print("routine.data() is null");
                                    }
                                    final routineIndex = index;
                                    final response = routineSnapshot;
                                    print(response);
                                    return SizedBox(
                                      height: 600,
                                      child: GridView.builder(
                                        itemCount: responseData.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 8,
                                                crossAxisSpacing: 8),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 60,
                                            width: 60,
                                            child: Image.network(
                                              response.data!.docs[index]
                                                  ['routine_cover_image_path'],
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  });
                            }),
                      );
                    })
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
