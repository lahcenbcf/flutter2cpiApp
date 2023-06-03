import 'package:flutter/material.dart';
class SignUpViewModel extends ChangeNotifier {
  bool _isEyeOffPassword = false;
  bool _isEyeOffConfirmPassword = false;
  final bool _isDuplicate=false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lasttNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
      

  bool get isEyeOffPassword => _isEyeOffPassword;
  bool get isDuplicate=>_isDuplicate;
  bool get isEyeOffConfirmPassword => _isEyeOffConfirmPassword;
  TextEditingController get fullNameController => _fullNameController;
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

// check for dots and spaces and other charachters
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
    }else if(isDuplicate){
      return "name entered is Duplicate";
    }else if(!input.contains(" ")){
      return "must have a space between LastName and FirstName";
    }
    return null;
  }
  bool check(String input){
    int j=0;
    int i=0;
    while(i<input.length){
      if(input[i]==" "){
        j++;
      }
      i++;
    }
    return (j==1);

    
  }
  bool checkSpaces(String input) {
    int i = 0;
    while (i < input.length && input[i] != " ") {
      i++;
    }
    return i == input.length;
  }

  String? emailValidator(String? email) {
    if (email == null || email.length <= 11) {
      return "enter your email";
    } else if (!checkSpaces(email)) {
      return "delete any extra space";
    } else if (email.substring(email.length - 11) != "@esi-sba.dz") {
      return "enter your esi-sba email";
    }
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassWord) {
    if (confirmPassWord != _passwordController.text) {
      return "not the same password";
    }
    return null;
  }
  
}
