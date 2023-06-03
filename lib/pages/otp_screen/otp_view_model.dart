import 'dart:convert';

import 'package:flluter2cpi/services/api.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class Otp_view extends ChangeNotifier{
  TextEditingController code1= TextEditingController();
  TextEditingController code2= TextEditingController();
  TextEditingController code3= TextEditingController();
  TextEditingController code4= TextEditingController();
  // ignore: non_constant_identifier_names
  String?message_success;
  // ignore: non_constant_identifier_names
  String?message_failed;
  cleanDigits(){
    code4.text="";
    code1.text="";
    code2.text="";
    code3.text="";
  }
  verifyDigits(String code,String email)async{
    Response response=await ApiServices.verifyDigits(code,email);
    var finalResult=response.body;
    debugPrint(finalResult);
    if(finalResult=="true"){
      message_success="success";
    }else{
      String message=json.decode(finalResult)?["message"];
      message_failed=message;
    }
    cleanDigits();
  }
}