import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:dia/views/daily_routine.dart';
import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:dia/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> iconList = [
      Icons.home,
      Icons.search,
      Icons.chat_bubble_outline_outlined,
      Icons.person
    ];
    final navBarModel = Provider.of<NavBarViewModel>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("assets/images/23.png"),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 10),
              spreadRadius: 10)
        ]),
        child: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          height: 75,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavbarIcon(
                    navBarModel: navBarModel,
                    iconList: iconList,
                    index: 0,
                  ),
                  NavbarIcon(
                      navBarModel: navBarModel, iconList: iconList, index: 1),
                  const SizedBox(),
                  NavbarIcon(
                      navBarModel: navBarModel, iconList: iconList, index: 2),
                  NavbarIcon(
                      navBarModel: navBarModel, iconList: iconList, index: 3),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: DiaryTopicList(),
              ),
              SizedBox(
                height: size.height,
                child: ListView.separated(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarIcon extends StatelessWidget {
  NavbarIcon({
    super.key,
    required this.navBarModel,
    required this.iconList,
    required this.index,
  });

  final NavBarViewModel navBarModel;
  final List<IconData> iconList;
  int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navBarModel.changeIndex(index),
      child: Icon(
        iconList[index],
        size: 31,
        color: navBarModel.selectionIndex == index
            ? CustomColors.primaryPurple
            : CustomColors.primaryGrey,
      ),
    );
  }
}
