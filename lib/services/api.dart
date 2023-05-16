import 'dart:convert';
import 'dart:core';

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
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
static Future<http.Response> addPost(String title,String ctx,String author,String tag,String postType,File image,String imagePath)async{
String userId=""; //ta3 user
Uint8List imageBytes =await image.readAsBytes();
String route=postType == "StuckPosts" ? "stuckPost" : "academicPost";
String base64Image=base64Encode(imageBytes);
Map<String,dynamic> bodyRequest={
  'image':base64Image,
  'imagePath':imagePath,
  "_id":userId
};
Uri requestUrl=Uri.parse("$_baseUrl/$route/addPost");
var response=await http.post(requestUrl,body:bodyRequest,headers: {
  'Content-Type':'application/json'
});

return response;
}

//like post
static Future<http.Response> likePost(String postId,String userId,String postType )async{
  String route=postType == "StuckPosts" ? "stuckPost" : (postType=="infoPosts" ? "infoPost":"academicPost");
  Uri requestUrl=Uri.parse("$_baseUrl/$route/likePost/$postId");
  var response=await http.post(requestUrl,body:{
    'userId':userId,
    'postType':postType
  });
  return response;
}

//add comment
static Future<http.Response> addComment(String author,String postId,String postType,String text,String formatedDate)async{
  String userId="";//ta3 user;
  String route=postType == "StuckPosts" ? "stuckPost" : "academicPost";
  Uri requestUrl=Uri.parse("$_baseUrl/$route/addComment/$postId");
  var response=await http.post(requestUrl,body:{
    "postType":postType,
    "date":formatedDate,
    "text":text,
    "_id":userId
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

// edit profile page
static Future<http.Response> editProfile(String name,String bio,String tlg,String linkd,String git,Uint8List imagesByte,String imagePath)async{
// get userId 
String userId="";
Uri requestUrl=Uri.parse("$_baseUrl/editProfileInfo");
var response=await http.post(requestUrl,body: {
"_id":userId,
"name":name,
"profilePic":imagesByte,
"imagePath":imagePath,
"telegram":tlg,
"linkedin":linkd,
"github":git,
"bio":bio

});
return response;
}

static Future<http.Response> editPassword(String newPassword,String imageEncodede,String imagePath)async{
  String userId="";
  Uri requestUrl=Uri.parse("$_baseUrl/editPassword");
  var response=await http.post(requestUrl,body:{
    "newPassword":newPassword,
    "_id":userId
  });
  return response;
}
//report post
static Future<http.Response> reportPost(String postId,String postType)async{
String userId=SharedPrefService.pref.getStringList("loginInfo")![0];
Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/reportPost");
var response=await http.post(requestUrl,body:{
  "postId":postId,
  "postType":postType,
  "userId":userId
});
return response;

}

//report Comment
static Future<http.Response> reportComment(String postType,String postId,String commentId)async{
String userId=SharedPrefService.pref.getStringList("loginInfo")![0];
Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/reportComment");
var response=await http.post(requestUrl,body:{
  "postId":postId,
  "postType":postType,
  "userId":userId,
  "commentId":commentId
});
return response;
}

//delete comment


static Future<http.Response> deleteReportedComment(String commentId,String postType,String postId)async{
  Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/deleteComment");
  var response=await http.post(requestUrl,body: {
    "commentId":commentId,
    "postId":postId,
    "postType":postType
  });
  return response;
}
/*static Future<http.Response> deleteReportedPost(String postType,String postId)async{
  Uri requestUrl=Uri.parse("$_baseUrl/stuckPost/deletePost/$postId");
  var response=await http.post(requestUrl,body:{
    
    "postType":postType
  });
  return response;
}*/

//save followed tags
static Future<http.Response> saveTags()async{
  String userId="";
  Uri requestUrl=Uri.parse("$_baseUrl/saveFollowedtags");
  var response=await http.post(requestUrl,body:{
    "userId":userId,
    "followedTags":followedTags
  });
  return response;
}
//get Artcles
static Future<http.Response> returnArticles()async{
  Uri requestUrl=Uri.parse("$_baseUrl/infoPost/getArticles");
  var response=await http.get(requestUrl);
  return response;
}
}
