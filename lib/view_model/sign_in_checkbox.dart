import 'package:flutter/material.dart';

class SignInCheckbox extends ChangeNotifier {
  bool checkboxStatus = false;
  void changeCheckboxStatus() {
    checkboxStatus = !checkboxStatus;
    notifyListeners();
  }
}
