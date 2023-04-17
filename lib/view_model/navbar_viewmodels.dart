import 'package:flutter/material.dart';

class NavBarViewModel extends ChangeNotifier {
  int selectionIndex = 0;
  void changeIndex(int newIndex) {
    selectionIndex = newIndex;
    notifyListeners();
  }
}
