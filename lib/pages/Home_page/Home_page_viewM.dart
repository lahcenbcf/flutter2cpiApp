import 'dart:convert';
// import 'dart:html';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Main_Pages/Academic_years/first_cpi/module_content.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Post-Info/post_info_v.dart';
import '../Post/post_v.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
// ignore: camel_case_types
class Home_page_viewM extends ChangeNotifier {
  String?message;
   static Future<List<List<Post>>> initPosts(String username)async{
    Response response=await ApiServices.fetchStuckPosts(username);
    List<dynamic> result=jsonDecode(response.body);
    List<Post> stuckPosts=[];
    if(result.isNotEmpty){
       stuckPosts=result.map<Post>((p) =>Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount:p?["comments"].length, title: p?["title"], description: p?["context"], date: p?["date"], userName: p?["author"], email: p?["email"], tag: p?["tag"],comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], image:p?["image"]!="" ? (p?["image"]):"",isBlack: p?["isBlack"],isReported: p?["isReported"],/*pathImage: p?["pathImage"]*/profilePic: p?["profilePic"] != "" ? (p?["profilePic"]): "",links: p?["links"],
    )).toList();
    }
  response=await ApiServices.fetchAcademicPosts(username);
  List<Post> academicPosts=[];
   result=jsonDecode(response.body);
  if(result.isNotEmpty){
    academicPosts=result.map<Post>((p) => Post(type: p?["postType"],title: p?["title"],description: p?["context"],date: p?["date"],likesCount: p?["likes"].length,commentsCount: p?["comments"].length,comments: p?["comments"],email:p?["email"],tag:p?["tag"],isLiked:p?["isLiked"],controllerTag: p?["_id"],userName: p?["author"],image:p?["image"]!="" ?(p?["image"]):"",isBlack: p?["isBlack"],isReported: p?["isReported"],/*pathImage: p?["pathImage"]*/profilePic: p?["profilePic"] != "" ? (p?["profilePic"]):"",links: p?["links"],)).toList();
  }
  List<Post> postInfos=[];
  response=await ApiServices.fetchInfoPosts(username);
  result=jsonDecode(response.body);
  if(result.isNotEmpty){
    postInfos=result.map<Post>((p) => Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount: p?["comments"].length, title: p?["title"], description: p?["context"], links: p?["links"], date: p?["date"], userName: p?["author"], email: p?["email"], tag: p?["tag"], comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], profilePic: p?["profilePic"] != "" ? (p?["profilePic"]): "", image:p?["image"] !="" ? (p?["image"]):"", isBlack: p?["isBlack"], isReported: p?["isReported"])).toList();
  }
  //print(stuckPosts[0].image)
  return [stuckPosts,academicPosts,postInfos];
}

static void updateTags(){
  //get FollowedTags of the user
  //List<String> followedTags=SharedPrefService.pref.getStringList("followedTags")!;
  //List<String> followedTags=["html","css"];
  List<String> newList=[];
  List<String> oTags=originalETags;
  if(followedTags.isNotEmpty){
    followedTags.map((e) => oTags.where((element) => element != e));
    newList.addAll(followedTags);
    newList.addAll(oTags);
   eTags=newList;
  }
}

static void saveFollowedTags()async{
  var response=await ApiServices.saveTags();
  var result=jsonDecode(response.body);
}

//fetch article posts
static Future<List<PostInfo>> fetchArtclePosts()async{
  print("hi from articles");
  var response=await ApiServices.returnArticles();
  List<dynamic> result=jsonDecode(response.body);
  
  List<PostInfo> articles=[];
  if(result.isNotEmpty){
    articles=result.map<PostInfo>((p) => PostInfo(image:p?["image"]!="" ? (p?["image"]) : ""  , title:p?["title"], description:p?["context"], date: p?["date"])).toList();
  }
  
  return articles;
}




}