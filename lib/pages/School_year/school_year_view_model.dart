import 'package:flutter/material.dart';

class SchoolYearViewModel extends ChangeNotifier{
  String? _selectedYear;
  bool _menuOpen = false;
  bool _isSchoolYearEntered = false;
  bool _buttonClicked = false;


  String? get selectedYear =>_selectedYear;
  bool get menuOpen => _menuOpen;
  bool get isSchoolYearEntered => _isSchoolYearEntered;
  bool get buttonClicked => _buttonClicked;

  enterYear(){
    _isSchoolYearEntered = true;
    notifyListeners();
  }
  selectYear(String? year){
    _selectedYear = year;
    notifyListeners();
  }

  menuOpened(bool isOpen){
    _menuOpen = isOpen;
    notifyListeners();
  }

  pressButton(){
    _buttonClicked = true;
    
    notifyListeners();
  
  }


}