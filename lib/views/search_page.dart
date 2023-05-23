import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/explore_viewmodel.dart';
import 'package:dia/view_model/home_page_viewmodel.dart';
import 'package:dia/widgets/searchbar_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/navbar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homePageVM = Provider.of<HomePageViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const NavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SearchBar(controller: controller),
            ExploreRoutineView(homePageVM, size),
          ],
        )),
      ),
    );
  }
}
