import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/views/routine_view.dart';
import 'package:dia/widgets/homepage_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homePageVM = Provider.of<HomePageViewModel>(context);
    return Scaffold(
        floatingActionButton: const NavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: HomePageAppBar(
          homePageVM: homePageVM,
          profileImageOnTap: () {
            if (scaffoldKey.currentState != null) {
              scaffoldKey.currentState!.openDrawer();
            } else {
              print("object");
            }
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Yan Menü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Ana Sayfa'),
                onTap: () {
                  // Ana sayfaya yönlendirme işlemleri burada yapılabilir
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Ayarlar'),
                onTap: () {
                  // Ayarlara yönlendirme işlemleri burada yapılabilir
                },
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Routines").snapshots(),
              builder: (context, snapshot) {
                // print(snapshot.data!.docs[0].data());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data == null) {
                  return Text("data");
                }
                final response = snapshot.data!;
                return MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    itemCount: response.docs.length,
                    itemBuilder: (context, index) {
                      return
                          //admob eklenecek
                          index % 2 == 0
                              ? Image.asset("assets/images/wash_face_img.png")
                              : GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => RoutineView(
                                            data: response.docs[index]),
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
                                          Container(
                                            height: 30,
                                            width: size.width / 2,
                                            color: Colors.white60,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.0,
                                                      horizontal: 10),
                                                  child: CircleAvatar(
                                                    radius: 13,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/wash_face_img.png"),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "ibra",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "88.Gün",
                                                      style: TextStyle(
                                                          color: CustomColors
                                                              .profilePrimaryColor,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                );
                    });
              },
            )));
  }
}
