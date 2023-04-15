import 'package:flutter/material.dart';

class PickImageBoolenValue extends ChangeNotifier {
  bool anonymousProfilePhoto = false;
  bool imagePicked = false;
  String pickedImagePath = "";
  String genderSelect = "Select";
  bool birthdayCheckbox = false;
  DateTime birthday = DateTime.now();

  void changeBirthdayCheckbox() {
    birthdayCheckbox = !birthdayCheckbox;
    notifyListeners();
  }

  void changeBirthday(DateTime value) {
    birthday = value;
    notifyListeners();
  }

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
