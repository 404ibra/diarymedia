import 'package:dia/constant/constants.dart';
import 'package:dia/view_model/navbar_viewmodels.dart';
import 'package:dia/views/daily_routine.dart';
import 'package:dia/views/new_diary/new_diary_view.dart';
import 'package:dia/widgets/floataction_button.dart';
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
      floatingActionButton: const FloatActionButton(),
      bottomNavigationBar: NavBar(navBarModel: navBarModel, iconList: iconList),
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
