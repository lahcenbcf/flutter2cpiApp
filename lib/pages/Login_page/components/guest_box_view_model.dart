

import 'package:flutter/material.dart';

class GuestBoxViewModel extends ChangeNotifier{
  final TextEditingController _fullNameController = TextEditingController();

  TextEditingController get fullNameController => _fullNameController;
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
    }
    return null;
  }


}