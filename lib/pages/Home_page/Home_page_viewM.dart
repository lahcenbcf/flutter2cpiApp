import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../Post/post_v.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
// ignore: camel_case_types
class Home_page_viewM extends ChangeNotifier {

   static Future<List<List<Post>>> initPosts(String username)async{
    Response response=await ApiServices.fetchStuckPosts(username);
    List<dynamic> result=jsonDecode(response.body);
    List<Post> stuckPosts=[];
    if(result.isNotEmpty){
       stuckPosts=result.map<Post>((p) =>Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount:p?["comments"].length, title: p?["title"], description: p?["context"], FormattedDate: p?["date"], userName: p?["author"], email: "hhhh", tag: p?["tags"],comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], image:base64.decode(p?["image"]),isBlack: p?["isBlack"],isReported: p?["isReported"],module: "",reportCounts: p?["reportCounts"],
    )).toList();
    }
  response=await ApiServices.fetchAcademicPosts(username);
  List<Post> academicPosts=[];
   result=jsonDecode(response.body);
  if(result.isNotEmpty){
    academicPosts=result.map<Post>((p) => Post(type: p?["postType"],title: p?["title"],description: p?["context"],FormattedDate: p?["date"],likesCount: p?["likes"].length,commentsCount: p?["comments"].length,comments: p?["comments"],email:"hhh",tag:[],isLiked:p?["isLiked"],controllerTag: p?["_id"],userName: p?["author"],image:base64.decode(p?["image"]),isBlack: p?["isBlack"],module: p?["module"],isReported: p?["isReported"],reportCounts: p?["reportCounts"],)).toList();
  }
 
  return [stuckPosts,academicPosts];
}

static void updateTags(){
  //get FollowedTags of the user
  //List<String> followedTags=SharedPrefService.pref.getStringList("followedTags")!;
  List<String> followedTags=["html","css"];
  List<String> newList=[];
  List<String> oTags=originalETags;
  if(followedTags.isNotEmpty){
    followedTags.map((e) => oTags.where((element) => element != e));
    newList.addAll(followedTags);
    newList.addAll(oTags);

   eTags=newList;
  }
  print(eTags);
}


}