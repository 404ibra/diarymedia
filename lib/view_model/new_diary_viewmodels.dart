import 'package:flutter/material.dart';

enum TopicNames<Int> { Agenda, Beauty, Sport, Education }

class TopicsContainerProivder extends ChangeNotifier {
  late DateTime routineStart;
  late DateTime routineEnd;

  int selectedIndex = -1;
  void changeTopicColor(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void changeRoutineDates(DateTime newRoutineStart, DateTime newRoutineEnd) {
    routineStart = DateTime.now();
    routineEnd = newRoutineEnd;
    notifyListeners();
  }
}
