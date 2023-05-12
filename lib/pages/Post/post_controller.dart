import 'dart:io';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  int likesCount = 0;
  int commentsCount = 0;
  bool isLiked = false;
  String controllerTag = "";
  String type = "";
  File? profilePic;

  //
  int getIndex(List<Post> myList) {
    bool found = false;
    int i = 0;
    while (!found && i < myList.length) {
      if (myList[i].controllerTag == controllerTag) {
        found = true;
      } else {
        i++;
      }
    }

    return found ? i : -1;
  }

  //
  onTap() {
    int index =0;
    switch (type) {
      case "StuckPosts":
        index = getIndex(ePosts);
        break;
        case "academicPosts":
        index = getIndex(aPosts);
        break;
      default:
      index = getIndex(infoPosts);
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
