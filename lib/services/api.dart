import 'package:flluter2cpi/pages/Sign_up/User_Modal.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  static const String _baseUrl="http://127.0.0.1:5000";

  static Future<http.Response> registerUser(UserModal user)async {

    Uri requestUri=Uri.parse("$_baseUrl/register");
    var response=await http.post(requestUri,body:user.toMap());
    return response ;
  }

  static Future<http.Response> loginUser(UserModal user)async {
    Uri requestUri=Uri.parse("$_baseUrl/login");
    var response=await http.post(requestUri,body:{
      "email":user.email,
      "password":user.password
    });
    return response;
  }

  static Future<http.Response> registerGuest(UserModal user)async{
    Uri requestUri=Uri.parse("$_baseUrl/registerGuest");
    var response=await http.post(requestUri,body: {
      "name":user.fullName
    });
    return response;
  }

  //logout

  static void logoutUser(BuildContext context){
    SharedPrefService.pref.clear();
    Navigator.pushNamed(context,"LogIn");
  }

  //send email to verify
  static Future<http.Response> verifyUser(String email)async{
    Uri requestUrl=Uri.parse("$_baseUrl/forgotPass");
    var response=await http.post(requestUrl,body:{
      "email":email
    });
  return response;
  }

  static Future<http.Response> verifyDigits(String code,String email)async{
    Uri requestUri=Uri.parse("$_baseUrl/verifyCode");
    var response=await http.post(requestUri,body:{
      "otp":code,
      "email":email
    });
    return response;
  }
}