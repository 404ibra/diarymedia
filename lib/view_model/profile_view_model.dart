import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  int profileSelectedIndex = 0;
  double currentHeight = 350;
  bool animatedStarted = false;
  void changeInformationHeight(double pixel, bool showInformation) {
    currentHeight = pixel;
    animatedStarted = showInformation;
    notifyListeners();
  }

  void changeSelectedIndex(int newIndex) {
    profileSelectedIndex = newIndex;
    notifyListeners();
  }
}
