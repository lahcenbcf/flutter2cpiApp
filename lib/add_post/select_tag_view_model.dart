
import 'package:flutter/material.dart';

class TagModel extends ChangeNotifier{
 
 bool isChecked = false;
  String text = "My Text";
  List<String> selectedTexts = [];

  void addSelectedText(String text) {
    selectedTexts.add(text);
    notifyListeners();
  }


}