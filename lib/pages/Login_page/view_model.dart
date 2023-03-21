import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flluter2cpi/pages/Sign_up/User_Modal.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';


class View extends ChangeNotifier {
  bool eyeoff = true;
  String? errorLoginMessage;
  bool isLogged = false;
  TextEditingController email_controler = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  bool checkSpaces(String input) {
    int i = 0;
    while (i < input.length && input[i] != " ") {
      i++;
    }
    return i == input.length;
  }

  validate(String? input) {
    if (input!.isEmpty || input.length < 11) {
      return "Enter correct email";
    } else if (input.substring(input.length - 11) != "@esi-sba.dz") {
      return "Enter your esi sba email";
    } else if (!checkSpaces(input)) {
      return "check the space";
    }
    return null;
  }

  switchState() {
    eyeoff = !eyeoff;
    notifyListeners();
  }

  loginUser(UserModal user) async {
    Response res = await ApiServices.loginUser(user);
    print(res.body);
    var finalResult = json.decode(res.body);
    print(finalResult);
    if (finalResult?["message"] != null) {
      errorLoginMessage = finalResult["message"];
    } else {
      //logged successufully
      isLogged = true;
      //store uerData Info session in the cacheDB
      await SharedPrefService.pref.setString('userinfo',finalResult.toString());
      await SharedPrefService.pref.setBool("isGuest",false);
    }
}}
