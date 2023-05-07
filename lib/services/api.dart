import 'dart:convert';
import 'dart:core';

import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
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
    debugPrint(user.password);
    Uri requestUri=Uri.parse("$_baseUrl/login");
    var response=await http.post(requestUri,body:{
      "email":user.email,
      "password":user.password
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

  static Future<http.Response> setNewPassword(String password,String email)async{
    Uri requestUri=Uri.parse("$_baseUrl/setNewPassword");
    var response=await http.post(requestUri,body: {
      "password":password,
      "email":email
    });
    return response;
  }

  static Future<http.Response> fetchStuckPosts(String username)async {
  Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/");
  var response=await http.post(requestUrl,body: {
    "userName":username
  });
  return response;
}
static Future<http.Response> fetchAcademicPosts(String username)async{
  Uri requestUrl=Uri.parse("$_baseUrl/academicPost");
  var response=await http.post(requestUrl,body:{
      "userName":username
    }
  );
  return response;
}
static Future<http.Response> getComments(String userName,String postId)async{
  Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/showComments");
  var response=await http.post(requestUrl,body:{
    "userName":userName,
    "postId":postId
  });
  return response;
}

//add post 
static Future<http.Response> addPost(String title,String ctx,String author,List<dynamic> tags,String postType,File image)async{
Uint8List imageBytes =await image.readAsBytes();
String base64Image=base64Encode(imageBytes);
Map<String,dynamic> bodyRequest={
  'image':base64Image
};
Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/addPost");
var response=await http.post(requestUrl,body:bodyRequest,headers: {
  'Content-Type':'application/json'
});

return response;
}

//like post
static Future<http.Response> likePost(String postId,String userId,String postType )async{
  String route=postType == "StuckPosts" ? "stuckPost" : "academicPost";
  Uri requestUrl=Uri.parse("$_baseUrl/$route/likePost/$postId");
  var response=await http.post(requestUrl,body:{
    'userId':userId,
    'postType':postType
  });
  return response;
}

//add comment
static Future<http.Response> addComment(String author,String postId,String postType,String text,String formatedDate)async{
  String route=postType == "StuckPosts" ? "stuckPost" : "academicPost";
  Uri requestUrl=Uri.parse("$_baseUrl/$route/addComment/$postId");
  var response=await http.post(requestUrl,body:{
    "author":author,
    "postType":postType,
    "date":formatedDate,
    "text":text
  });
  return response;
}

// like comment
static Future<http.Response> likeComment(String commentId,String userId)async{
  Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/likeComment/$commentId");
  var response=await http.post(requestUrl,body: {
    "userId":userId
  });
  return response;
}
static Future<http.Response> returnTags(String userId)async{
  Uri requestUrl=Uri.parse("$_baseUrl/returnTags/$userId");
  var response =await http.get(requestUrl);
  return response;
}



}

