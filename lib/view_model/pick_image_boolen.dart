import 'package:flutter/material.dart';

class PickImageBoolenValue extends ChangeNotifier {
  bool imagePicked = false;
  String? pickedImagePath;
  void changeImagePickedStatus() {
    imagePicked = !imagePicked;
    notifyListeners();
  }

  void changePickedImagePath(String path) {
    pickedImagePath = path;
    notifyListeners();
  }
}
