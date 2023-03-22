import 'package:flutter/material.dart';

class NewPasswordViewModel extends ChangeNotifier {
  bool eyeOpenedPassword = false;
  bool eyeOpenedConfirmPassword = false;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

      swithPassworState() {
    eyeOpenedPassword = !eyeOpenedPassword;
    notifyListeners();
  }

  swithConfirmPassworState() {
    eyeOpenedConfirmPassword = !eyeOpenedConfirmPassword;
    notifyListeners();
  }

  String? confirmPasswordValidator(String? confirmPassWord) {
    if (confirmPassWord != newPasswordController.text) {
      return "not the same password";
    }
    return null;
  }
}