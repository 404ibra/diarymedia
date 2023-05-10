import 'package:flutter/material.dart';

class AppbarViewModel extends ChangeNotifier {
  int currentIndex = 0;
  void changeSelectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
