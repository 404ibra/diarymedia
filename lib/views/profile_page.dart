import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/profile_view_model.dart';
import 'package:dia/widgets/myprofile_appbar.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:dia/widgets/profile_information_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profileVM = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      floatingActionButton: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: MyProfileAppBar(profileVM: profileVM),
      backgroundColor: const Color(0xfffedf3fa),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels > 60) {
            profileVM.changeInformationHeight(0, true);
          } else if (notification.metrics.pixels < -60) {
            profileVM.changeInformationHeight(350, false);
          }
          return true;
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileInformationSection(),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12),
                    child: profileVM.profileSelectedIndex == 0
                        ? profileVM.MyProfileVM(size)
                        : Column(
                            children: const [
                              SizedBox(
                                height: 60,
                              ),
                              Week17(),
                              SizedBox(
                                height: 60,
                              ),
                              Week17(),
                              SizedBox(
                                height: 60,
                              ),
                              Week17(),
                            ],
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Week17 extends StatelessWidget {
  const Week17({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
        WeekBox(),
      ],
    );
  }
}

class WeekBox extends StatelessWidget {
  const WeekBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DayBox(),
        DayBox(),
        DayBox(),
        DayBox(),
        DayBox(),
        DayBox(),
      ],
    );
  }
}

class DayBox extends StatelessWidget {
  const DayBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0, right: 3),
      child: Container(
        height: 17,
        width: 17,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: CustomColors.profileSecondoryColor.withOpacity(0.5)),
      ),
    );
  }
}
