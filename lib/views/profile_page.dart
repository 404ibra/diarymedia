import 'package:dia/constant/constants.dart';
import 'package:dia/widgets/profile_information_section.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Color(0xffffafcfe),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: CustomColors.profilePrimaryColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: CustomColors.profilePrimaryColor,
              )),
        ],
      ),
      backgroundColor: Color(0xfffedf3fa),
      body: SafeArea(
        child: Column(
          children: <Widget>[ProfileInformationSection(size: size)],
        ),
      ),
    );
  }
}
