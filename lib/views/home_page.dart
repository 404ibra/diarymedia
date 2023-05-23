import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/explore_viewmodel.dart';
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
        body: ExploreRoutineView(homePageVM, size));
  }
}
