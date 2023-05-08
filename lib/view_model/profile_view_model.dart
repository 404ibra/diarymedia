import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  double currentHeight = 350;
  void changeInformationHeight(double pixel) {
    currentHeight = pixel;
    notifyListeners();
  }
}
