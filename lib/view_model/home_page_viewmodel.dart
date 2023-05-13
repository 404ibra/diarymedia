import 'package:flutter/material.dart';

class HomePageViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
