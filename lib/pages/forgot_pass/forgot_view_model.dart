import 'dart:convert';

import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

// ignore: camel_case_types
class View_model extends ChangeNotifier{

  // ignore: non_constant_identifier_names
  TextEditingController email_controler1=TextEditingController();
  // ignore: non_constant_identifier_names
  bool CanPass=false;
  String?messageToShown;
  bool checkSpaces(String input) {
    int i = 0;
    while (i < input.length && input[i] != " ") {
      i++;
    }
    return i == input.length;
  }
  validate(String? input) {  if(input!.isEmpty || input.length<11){
    return "Enter correct email";}else if(input.substring(input.length-11)!="@esi-sba.dz"){
    return "Enter your esi sba email";

  }
  else if(!checkSpaces(input)){
    return "check the space";
  }
  return null;
  }

  sendEmailToVerify(String email)async {
    notifyListeners();
    Response response=await ApiServices.verifyUser(email);
    var resultFinale=response.body;
    debugPrint(resultFinale);
    // ignore: unrelated_type_equality_checks
    if(resultFinale=="true"){
      CanPass=true;
    }else{
      String message= json.decode(resultFinale)?["message"];
      messageToShown=message;
    }
      
  }


}