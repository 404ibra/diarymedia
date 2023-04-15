import 'package:flutter/material.dart';

class PickImageBoolenValue extends ChangeNotifier {
  bool anonymousProfilePhoto = false;
  bool imagePicked = false;
  String pickedImagePath = "";
  String genderSelect = "Select";
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

  void changeGenderSelect(String gender) {
    genderSelect = gender;
    notifyListeners();
  }
}
