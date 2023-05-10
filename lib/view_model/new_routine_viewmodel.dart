import 'package:flutter/material.dart';

class NewRoutineViewModel extends ChangeNotifier {
  String? routineMainImagePath;
  bool selectedImagePath = false;
  void newRoutineMainImage(String path) {
    routineMainImagePath = path;
    selectedImagePath = true;
    notifyListeners();
    return;
  }
}
