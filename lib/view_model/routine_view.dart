import 'package:flutter/material.dart';

class RoutineViewModel extends ChangeNotifier {
  double currentHeight = 350;
  bool aniamatedStarted = false;

  void changeInformationHeight(double pixel, bool showInformation) {
    currentHeight = pixel;
    aniamatedStarted = showInformation;
    notifyListeners();
  }
}
