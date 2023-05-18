import 'package:dia/constant/custom_colors.dart';
import 'package:dia/widgets/searchbar_filed.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const NavBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBar(controller: controller),
          ],
        ),
      ),
    );
  }
}
