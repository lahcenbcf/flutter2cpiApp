import 'dart:convert';

import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewPasswordViewModel extends ChangeNotifier {
  bool eyeOpenedPassword = false;
  bool eyeOpenedConfirmPassword = false;
  bool success=false;
  String?message;
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
  cleanInputs(emailInput){
    newPasswordController.text="";
    confirmPasswordController.text="";
    emailInput="";
  }
  setNewPassword(String password,String email)async{
    Response response=await ApiServices.setNewPassword(password, email);
    var resultfinal=response.body;
    if(resultfinal=="true"){
      //done
        success=true;
        debugPrint("sucesssssssssssssssss");
    }else{
      message=json.decode(resultfinal)?["message"];
    }
  }
}