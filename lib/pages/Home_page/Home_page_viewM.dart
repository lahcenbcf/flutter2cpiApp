import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../Post/post_v.dart';

// ignore: camel_case_types
class Home_page_viewM extends ChangeNotifier {

   static Future<List<Post>?> getStuckPosts(String username)async{
    Response response=await ApiServices.fetchStuckPosts(username);
    List<dynamic> result=jsonDecode(response.body);
    var stuckPosts=result.map<Post>((p) =>Post(type: p?["postType"], likesCount: p?["likes"].length, commentsCount:p?["comments"].length, title: p?["title"], description: p?["context"], FormattedDate: p?["date"], userName: p?["author"], email: "hhhh", tag: p?["tags"],comments: p?["comments"], isLiked: p?["isLiked"], controllerTag: p?["_id"], image:base64.decode(p?["image"]),
    )).toList();
    ePosts=stuckPosts;
}
/*static Future<List<Post>?> getAcademicPosts(String username)async{
  Response result=await ApiServices.fetchAcademicPosts(username);
  List<dynamic> responseData=jsonDecode(result.body);
  
  if(responseData.isNotEmpty){
    List<Post> academicPosts=responseData.map<Post>((p) => Post(type: p?["postType"],title: p?["title"],description: p?["context"],date: new DateTime(222),likesCount: p?["likes"].length,commentsCount: p?["comments"].length,comments: p?["comments"],email:p?["email"],tag:p?['tags'],isLiked:p?["isLiked"],controllerTag: p?["_id"],userName: p?["author"],image:p?["image"])).toList();
    aPosts=academicPosts;
  }
  
}*/
}