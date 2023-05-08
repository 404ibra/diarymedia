import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/profile_information_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context);

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
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels > 250) {
            profileVM.changeInformationHeight(0);
          }
          return true;
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                ProfileInformationSection(),
                Container(
                  height: 120,
                  width: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 120,
                  width: 50,
                  color: Colors.green,
                ),
                Container(
                  height: 120,
                  width: 50,
                  color: Colors.pink,
                ),
                Container(
                  height: 120,
                  width: 50,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
