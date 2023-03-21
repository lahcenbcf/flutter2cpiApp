import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../services/api.dart';
import '../Sign_up/User_Modal.dart';

class SchoolYearViewModel extends ChangeNotifier{
  String? _selectedYear;
  bool _menuOpen = false;
  bool _successRegister=false;
  String ? _isDuplicateMessage;

  set  setYear(String? year) => _selectedYear=year;
  String? get selectedYear =>_selectedYear;
  bool get successRegister=>_successRegister;
  bool get menuOpen => _menuOpen;
  String get isDuplicate=>_isDuplicateMessage!;



  menuOpened(bool isOpen){
    _menuOpen = isOpen;
    notifyListeners();
  }

  pressButton(UserModal user)async{
    notifyListeners();
    
    if(_selectedYear !=null){
      Response res=await ApiServices.registerUser(user);
     var finalres=json.decode(res.body);
      if(finalres?["message"] != null){//it means duplicate email is found
  _isDuplicateMessage=finalres["message"];
      }else{
        //there is a normal registration
        _successRegister=true;
    }
    
   
  
  }


}}