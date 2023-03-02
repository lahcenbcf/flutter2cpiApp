import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  bool _isEyeOffPassword = false;
  bool _isEyeOffConfirmPassword = false;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lasttNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool get isEyeOffPassword => _isEyeOffPassword;
  bool get isEyeOffConfirmPassword => _isEyeOffConfirmPassword;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get lasttNameController => _lasttNameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  swithPassworState() {
    _isEyeOffPassword = !_isEyeOffPassword;
    notifyListeners();
  }

  swithConfirmPassworState() {
    _isEyeOffConfirmPassword = !_isEyeOffConfirmPassword;
    notifyListeners();
  }

  bool checkfor(String text, String char) {
    int i = 0;

    if (char == ".") {
      while (i < text.length && text[i] != char) {
        i++;
      }
      return i == text.length;
    } else if (char == " ") {
      int spaceNumber = 0;
      while (i < text.length && spaceNumber < 5) {
        if (text[i] == char) {
          spaceNumber++;
        }
        i++;
      }
      return spaceNumber == 5;
    } else {
      while (i < text.length &&
          "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ."
              .contains(text[i])) {
        i++;
      }
      return i == text.length;
    }
  }

  String? nameValidator(String? input) {
    if (input == null) {
      return "enter your name";
    } else if (input.isEmpty) {
      return "enter your name";
    } else if (!checkfor(input, ".")) {
      return "no dot is allowed";
    } else if (checkfor(input, " ")) {
      return "delete any extra space";
    } else if (!checkfor(input, "1@")) {
      return "delete any extra character";
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email == null) {
      return "enter your email";
    } else if (email.length < 12) {
      return "enter your email";
    } else if (email.substring(email.length - 11) != "@esi-sba.dz") {
      return "enter your esi-sba email";
    }
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassWord){
    if (confirmPassWord != _passwordController.text) {
      return "invalid password";
    }
    return null;
  }
}
