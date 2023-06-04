import 'dart:convert';
import 'package:flluter2cpi/pages/Home_page/Home_page_viewM.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:http/http.dart';
import 'package:flluter2cpi/pages/Sign_up/User_Modal.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';


class Vieww extends ChangeNotifier {
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

    var finalResult1 = json.decode(res.body);
    if (finalResult1?["message"] != null) {
      errorLoginMessage = finalResult1["message"];
    } else {
      debugPrint("say forget");
     var finalResult=finalResult1["userInfo"];
      //logged successufully
      isLogged = true;
      
      //store uerData Info session in the cacheDB
      int position=finalResult["fullName"].indexOf(" ");
      //print(position);
      String lastName=finalResult?["fullName"].substring(0,position);
      String firstName=finalResult?["fullName"].substring(position+1,finalResult?["fullName"].length);
      String profilePicture=finalResult?["profilePic"];
      List<String> loginInfo=[finalResult["fullName"],lastName,firstName,finalResult?["email"],finalResult?["_id"],finalResult?["github"],finalResult?["linkedin"],finalResult?["telegram"],profilePicture,finalResult?["bio"]];
      userInfo=loginInfo;
      List<dynamic> followedTags=finalResult?["followedTags"];
      print(followedTags);
      

      List<String> ftags=followedTags.map<String>((e) =>e ).toList();
      followedTags=followedTags;
      print(ftags);
      Home_page_viewM.updateTags();
      await SharedPrefService.pref.setStringList("loginInfo", loginInfo);
      await SharedPrefService.pref.setStringList("followedTags", ftags);
      
      await SharedPrefService.pref.setBool("isGuest",false);
      
    }
}}
