import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/routine_view.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/routine_head.dart';

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
        body: SingleChildScrollView(
          child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels > 60) {
                  routineVM.changeInformationHeight(0, true);
                  routineVM.changeImageAnimation(true);
                } else if (notification.metrics.pixels < -60) {
                  routineVM.changeInformationHeight(350, false);
                  if (routineVM.aniamatedStarted == false) {
                    routineVM.changeImageAnimation(false);
                  }
                }
                return true;
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RoutineHead(routineVM: routineVM, data: data, size: size),
                    const SizedBox(height: 15),
                    // routineVM.RoutineContents(size, data)
                    FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('Routines')
                          .doc(data['routine_id'])
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Veri alınamadı: ${snapshot.error}');
                        } else if (!snapshot.hasData || snapshot.data == null) {
                          return const Text('Veri bulunamadı.');
                        }
                        final snap =
                            snapshot.data!.get('routine_content') as List;
                        //  print(snap[1]['routine_text']);
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snap.length,
                            itemBuilder: (context, index) {
                              DateTime routineDate =
                                  (snap[index]['routine_date'] as Timestamp)
                                      .toDate();
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16, bottom: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${routineDate.day.toString()}/${routineDate.month.toString()}/${routineDate.year.toString()}",
                                      style: const TextStyle(
                                          color:
                                              CustomColors.profilePrimaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      snap[index]['routine_text'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(height: 7),
                                    Center(
                                      child: Container(
                                          height: size.height / 3.1,
                                          width: size.width / 2.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    offset: const Offset(0, 2),
                                                    spreadRadius: 0.2,
                                                    blurRadius: 0.2)
                                              ]),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              snap[index]['routine_image_path'],
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),
                                    const SizedBox(height: 3),
                                    const Divider()
                                  ],
                                ),
                              );
                            });
                      },
                    )
                  ])),
        ));
  }
}


/*   Future<void> getFriendsList() async {
                            final friendsList = await FirebaseFirestore.instance
                                .collection("Routines")
                                .doc(data['routine_id'])
                                .get()
                                .then((value) {
                              List list = [];

                              final nl =
                                  list.addAll(value.data()!["routine_content"]);
                              print(list);

                              return list
                                  .addAll(value.data()!["routine_content"]);
                            });
                          }

                          getFriendsList();*/