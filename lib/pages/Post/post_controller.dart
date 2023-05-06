import 'dart:convert';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:get/get.dart';


class PostController extends GetxController {

  int likesCount = 0;
  int commentsCount = 0;
  bool isLiked = false;
  String controllerTag = "";
  String type = "";
  String errorMessage="";
  String successMessage="";

  //
  int getIndex(List<Post> myList){
    bool found = false;
    int i = 0;
while(!found && i< myList.length){
   if (myList[i].controllerTag == controllerTag) {
     found = true;
    
   }else{
    i++;
   }
}

  return found ? i : -1;

  }
  //like post
  likePost()async{
    var res=await ApiServices.likePost(controllerTag, "6439d42fac4d0cf5f4518a8d", type);
    var result=jsonDecode(res.body);
    if(result!=true){
      errorMessage=result?["message"];
    }else{
      successMessage="added successufully";
    }
  }
  //
  onTap() {
    // call like Post
    int index =type == "StuckPosts"? getIndex(ePosts) : getIndex(aPosts);
    if (isLiked) {
      likesCount--;// ui
     type == "StuckPosts" ? ePosts[index].likesCount-- :aPosts[index].likesCount-- ;// keep trace
    } else {
      likesCount++;
     type == "StuckPosts" ? ePosts[index].likesCount++ :aPosts[index].likesCount++ ;

      // y.likesCount++;
    }
    isLiked = !isLiked;
     ePosts[index].isLiked =! ePosts[index].isLiked;
    update();
    // like post must call in the end to avoid the problem of "index out of the range"
    likePost();

  }
  //
  //
  //
  
  String displayLikes() {
    if (likesCount == 0) {
      return "likes";
    }else
     if (likesCount >= 1000000) {
      return "${(likesCount / 1000000).toStringAsFixed(1)}m";
    }else if(likesCount >= 1000){
      return "${(likesCount / 1000).toStringAsFixed(1)}k";
    }
    return "$likesCount";
  }

  //
  //
  String displayComments(){
    if (commentsCount == 0) {
      return "likes";
    }else
     if (commentsCount >= 1000000) {
      return "${(commentsCount / 1000000).toStringAsFixed(1)}m";
    }else if(commentsCount >= 1000){
      return "${(commentsCount / 1000).toStringAsFixed(1)}k";
    }
    return "$commentsCount";
   
  }

}
