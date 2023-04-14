import 'package:flutter/material.dart';

class PickImageStage extends ChangeNotifier {
  bool anonymousProfilePhoto = false;
  bool imagePicked = false;
  String pickedImagePath = "";
  void changeImagePickedStatus() {
    imagePicked = !imagePicked;
    notifyListeners();
  }

  void changePickedImagePath(String path) {
    pickedImagePath = path;
    notifyListeners();
  }

  void changeAnonymousProfilePhoto() {
    anonymousProfilePhoto = !anonymousProfilePhoto;
    notifyListeners();
  }
}
