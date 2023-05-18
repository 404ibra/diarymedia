import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constant/constants.dart';

class RoutineViewModel extends ChangeNotifier {
  double currentHeight = 310;
  bool aniamatedStarted = false;

  void changeInformationHeight(double pixel, bool showInformation) {
    currentHeight = pixel;
    aniamatedStarted = showInformation;
    notifyListeners();
  }

  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> RoutineContents(
      Size size, final data) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Routines")
            .doc(data['routine_id'])
            .snapshots(),
        builder: (context, routine) {
          if (routine.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (routine.data == null) {
            print("routine.data is null");
          } else if (routine.hasError) {
            print("error var");
          }
          final routineContentResponse = routine.data!.data()!;
          return SizedBox(
            height: size.height,
            child: ListView.builder(
                itemCount: routineContentResponse['routine_content'].length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "23 Mayıs Pazar 2023",
                                style: TextStyle(
                                    color: CustomColors.profilePrimaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "80.Gün",
                                style: TextStyle(
                                    color: CustomColors.profileSecondoryColor,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Text(
                            routineContentResponse['routine_content'][index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Center(
                              child: Icon(
                                Icons.ac_unit_sharp,
                                size: 120,
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }

  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>
      RoutineHeaderUserInformation(final data) {
    return StreamBuilder(
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
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage("assets/images/wash_face_img.png"),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
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
                ),
              ],
            ),
          );
        });
  }
}
