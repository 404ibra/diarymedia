import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  double currentHeight = 350;
  bool animatedStarted = false;
  void changeInformationHeight(double pixel, bool showInformation) {
    currentHeight = pixel;
    animatedStarted = showInformation;
    notifyListeners();
  }
}
