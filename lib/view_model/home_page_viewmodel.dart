import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  bool onLongPress = false;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void convertLongPress() {
    onLongPress = true;
    notifyListeners();
  }
}
