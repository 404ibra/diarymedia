import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/new_diary_viewmodels.dart';

class RoutineProps extends StatelessWidget {
  const RoutineProps({super.key});

  @override
  Widget build(BuildContext context) {
    final routineDetailsVM = Provider.of<TopicsContainerProivder>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
                WeekDayBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WeekDayBox extends StatelessWidget {
  const WeekDayBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmptyDayBox(),
        EmptyDayBox(),
        EmptyDayBox(),
        EmptyDayBox(),
        EmptyDayBox(),
        EmptyDayBox(),
      ],
    );
  }
}

class EmptyDayBox extends StatelessWidget {
  const EmptyDayBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0, right: 3),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300),
      ),
    );
  }
}
