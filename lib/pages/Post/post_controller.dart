import 'dart:convert';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart' show Uint8List, aPosts, ePosts, infoPosts;
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:get/get.dart';
class PostController extends GetxController {
  int likesCount = 0;
  int commentsCount = 0;
  bool isLiked = false;
  String controllerTag = "";
  String type = "";
  String?message;
  String?profilePath;
  Uint8List?profilePic;
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
    likePost()async{
    var res=await ApiServices.likePost(controllerTag, "6439d42fac4d0cf5f4518a8d", type);
    var result=jsonDecode(res.body);
    if(result!=true){
      message=result?["message"];
    }else{
      message="added successufully";
    }
  }
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
    // like post must call in the end to avoid the problem of "index out of the range"
    //likePost();

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
