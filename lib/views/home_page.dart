import 'package:dia/constant/custom_colors.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:dia/views/daily_routine.dart';
import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:dia/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarModel = Provider.of<NavBarViewModel>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xfffa7cdc8),
                Color(0xfffaeb9ce),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: SizedBox.square(
                    dimension: 25,
                    child: Image.asset(
                      "assets/images/home.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                InkWell(
                  child: SizedBox.square(
                    dimension: 25,
                    child: Image.asset(
                      "assets/images/comment.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const NewDiary(),
                            transition: Transition.fadeIn);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            CustomColors.primaryPurple.withOpacity(0.8),
                        backgroundImage:
                            const AssetImage("assets/images/string.png"),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const ProfilePage(),
                        transition: Transition.fadeIn);
                  },
                  child: SizedBox.square(
                    dimension: 24,
                    child: Image.asset(
                      "assets/images/profile.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                InkWell(
                  child: SizedBox.square(
                    dimension: 25,
                    child: Image.asset(
                      "assets/images/search.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: const [
                        DailyRoutine(),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: 12),
            ],
          ),
        ),
      ),
    );
  }
}
