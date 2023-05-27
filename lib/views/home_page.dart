import 'package:dia/view_model/explore_viewmodel.dart';
import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/widgets/drawer_menu.dart';
import 'package:dia/widgets/homepage_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
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
        drawer: const CustomDrawerMenu(),
        body: ExploreRoutineView(homePageVM, size));
  }
}
