import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:get/get.dart';

import '../../services/api.dart';

class PostController extends GetxController {
  int likesCount = 0;
  int commentsCount = 0;
  bool isLiked = false;
  String controllerTag = "";
  String type = "";
  String? profilePic;

  //
  int getIndex(List<Post> myList,String id) {
    bool found = false;
    int i = 0;
    while (!found && i < myList.length) {
      if (myList[i].controllerTag == id) {
        found = true;
      } else {
        i++;
      }
    }

    return found ? i : -1;
  }

  //like post 
  likePost()async{
    
    var res=await ApiServices.likePost(controllerTag, userInfo != null ? userInfo![4] : "", type);
    var result=jsonDecode(res.body);
  }
  onTap(String postId) {
    int index =0;
    switch (type) {
      case "StuckPosts":
        index = getIndex(ePosts,postId);
        break;
        case "academicPosts":
        index = getIndex(aPosts,postId);
        break;
      default:
      index = getIndex(infoPosts,postId);
    }
    if (isLiked) {
      likesCount--; // ui
  

      switch (type) {
      case "StuckPosts":
        ePosts[index].likesCount--;
        break;
        case "academicPosts":
        aPosts[index].likesCount--;
     
        break;
      default:
        infoPosts[index].likesCount--;
     
    }    
    } else {
      likesCount++;
     
switch (type) {
      case "StuckPosts":
        ePosts[index].likesCount++;
        break;
        case "academicPosts":
        aPosts[index].likesCount++;
     
        break;
      default:
        infoPosts[index].likesCount++;
     
    } 
      // y.likesCount++;
    }
    isLiked = !isLiked;
   switch (type) {
      case "StuckPosts":
        ePosts[index].isLiked = !ePosts[index].isLiked ;
        break;
        case "academicPosts":
        aPosts[index].isLiked = !aPosts[index].isLiked ;
        
     
        break;
      default:
        infoPosts[index].isLiked = !infoPosts[index].isLiked ;
       
     
    } 

    update();
    likePost();
  }
  //
  //
  //

  String displayLikes() {
    if (likesCount == 0) {
      return "likes";
    } else if (likesCount >= 1000000) {
      return "${(likesCount / 1000000).toStringAsFixed(1)}m";
    } else if (likesCount >= 1000) {
      return "${(likesCount / 1000).toStringAsFixed(1)}k";
    }
    return "$likesCount";
  }

  //
  //
  String displayComments() {
    if (commentsCount == 0) {
      return "comments";
    } else if (commentsCount >= 1000000) {
      return "${(commentsCount / 1000000).toStringAsFixed(1)}m";
    } else if (commentsCount >= 1000) {
      return "${(commentsCount / 1000).toStringAsFixed(1)}k";
    }
    return "$commentsCount";
  }

  
}

