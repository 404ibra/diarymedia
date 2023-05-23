import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/views/routine_view.dart';
import 'package:dia/widgets/routine_bottom_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

Padding ExploreRoutineView(HomePageViewModel homePageVM, Size size) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Routines").snapshots(),
        builder: (context, snapshot) {
          // print(snapshot.data!.docs[0].data());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.data == null) {
            return Text("data");
          }
          final response = snapshot.data!;
          return MasonryGridView.count(
              physics: const PageScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: response.docs.length,
              itemBuilder: (context, index) {
                return
                    //admob eklenecek
                    index % 7 == 0
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                                Image.asset("assets/images/wash_face_img.png"))

                        //routineler
                        : GestureDetector(
                            onTap: () {
                              Get.to(
                                  () => RoutineView(data: response.docs[index]),
                                  transition: Transition.zoom);
                            },
                            onLongPress: () {
                              homePageVM.convertLongPress();
                            },
                            child: Column(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image.network(
                                      response.docs[index]
                                          ['routine_cover_image_path'],
                                      fit: BoxFit.cover,
                                    ),
                                    const RoutineBottomInformation(),
                                  ],
                                ),
                              )
                            ]),
                          );
              });
        },
      ));
}
