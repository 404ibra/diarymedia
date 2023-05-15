import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/routine_view.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key, required this.data});

  final data;
  @override
  Widget build(BuildContext context) {
    final routineVM = Provider.of<RoutineViewModel>(context);
    final size = MediaQuery.of(context).size;
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
        body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 60) {
                routineVM.changeInformationHeight(0, true);
              } else if (notification.metrics.pixels < -60) {
                routineVM.changeInformationHeight(350, false);
              }
              return true;
            },
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.ease,
                      height: routineVM.currentHeight,
                      decoration: BoxDecoration(
                          color: const Color(0xffffafcfe),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 10)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoutineOwnerHeadline(data: data),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, right: 16, top: 8, bottom: 10),
                            child: Text(
                              "İbrahim ile 80 günde Devr-i Alem",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.profilePrimaryColor,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 16, right: 16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: size.height / 4,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 1,
                                          spreadRadius: 0.5,
                                        )
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      data['routine_cover_image_path'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  data['routine_categorie'],
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      shadows: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            offset: const Offset(1, 1))
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //routines
                    const SizedBox(height: 15),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Routines")
                            .doc(data['routine_id'])
                            .snapshots(),
                        builder: (context, routine) {
                          if (routine.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (routine.data == null) {
                            print("routine.data is null");
                          } else if (routine.hasError) {
                            print("error var");
                          }
                          final routineContentResponse = routine.data!.data()!;
                          return SizedBox(
                            height: size.height,
                            child: ListView.builder(
                                itemCount:
                                    routineContentResponse['routine_content']
                                        .length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "14 Mayıs Pazar 2023",
                                                style: TextStyle(
                                                    color: CustomColors
                                                        .profilePrimaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "80.Gün",
                                                style: TextStyle(
                                                    color: CustomColors
                                                        .profileSecondoryColor,
                                                    fontSize: 13.5,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Text(
                                            routineContentResponse[
                                                'routine_content'][index],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          const Divider()
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          );
                        })
                  ],
                ),
              ),
            )));
  }
}

class RoutineOwnerHeadline extends StatelessWidget {
  const RoutineOwnerHeadline({
    super.key,
    required this.data,
  });

  final data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 8),
              child: CircleAvatar(
                radius: 17,
                backgroundImage: AssetImage("assets/images/wash_face_img.png"),
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
                  print(data['routine_content'][0]);
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
        ),
        IconButton(
            onPressed: () {},
            icon: SizedBox.square(
                dimension: 20, child: Image.asset("assets/images/dots.png")))
      ],
    );
  }
}
