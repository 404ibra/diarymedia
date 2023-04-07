import 'package:flutter/material.dart';

class CreateInitProfileProviders extends ChangeNotifier {
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
}
