import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constant/constants.dart';

class ProfileViewModel extends ChangeNotifier {
  int profileSelectedIndex = 0;
  double currentHeight = 350;
  bool animatedStarted = false;

  void changeInformationHeight(double pixel, bool showInformation) {
    currentHeight = pixel;
    animatedStarted = showInformation;
    notifyListeners();
  }

  void changeSelectedIndex(int newIndex) {
    profileSelectedIndex = newIndex;
    notifyListeners();
  }

  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> MyProfileVM(Size size) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseCurrentUserService.uid)
            .snapshots(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (userSnapshot.data == null) {
            print("usersnapshot is null");
          } else if (userSnapshot.data!.data() == null) {
            print("usersnapshot.data() is null");
          }
          final responseData = userSnapshot.data!.data()!['routines'];

          return SizedBox(
            height: size.height,
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
                        }
                        final response = routineSnapshot;
                        return SizedBox(
                          height: size.height,
                          child: MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              itemCount: responseData.length,
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(response.data!
                                      .docs[index]['routine_cover_image_path']),
                                );
                              }),
                        );
                      });
                }),
          );
        });
  }
}
