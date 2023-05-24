import 'package:flutter/material.dart';

class NewRoutineViewModel extends ChangeNotifier {
  String? routineMainImagePath;
  String? routineDetailsImagePath;

  bool selectedImagePath = false;
  bool selectedRoutineDetailsPath = false;

  void newRoutineMainImage(String path) {
    routineMainImagePath = path;
    selectedImagePath = true;
    notifyListeners();
    return;
  }

  void routineDetailImage(String path) {
    routineDetailsImagePath = path;
    selectedRoutineDetailsPath = true;
    notifyListeners();
    return;
  }
}
