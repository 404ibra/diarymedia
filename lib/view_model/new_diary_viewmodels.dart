import 'package:flutter/material.dart';

enum TopicNames<Int> { Agenda, Beauty, Sport, Education }

class TopicsContainerProivder extends ChangeNotifier {
  int selectedIndex = -1;
  void changeTopicColor(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
