import 'package:dia/constant/custom_colors.dart';
import 'package:dia/widgets/custom_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key, required this.data});

  final data;
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
