import 'package:flutter/material.dart';

enum TopicNames<Int> { Agenda, Beauty, Sport, Education }

class TopicsContainerProivder extends ChangeNotifier {
  int selectedTopics = -1;
  void changeTopicColor(int index) {
    selectedTopics = index;
    notifyListeners();
  }
}
