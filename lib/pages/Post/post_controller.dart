import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:get/get.dart';


class PostController extends GetxController {

  int likesCount = 0;
  int commentsCount = 0;
  bool isLiked = false;
  String controllerTag = "";
  String type = "";

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
  //
  onTap() {
    int index =type == "stack"? getIndex(ePosts) : getIndex(aPosts);
    if (isLiked) {
      likesCount--;// ui
     type == "stack" ? ePosts[index].likesCount-- :aPosts[index].likesCount-- ;// keep trace
    } else {
      likesCount++;
     type == "stack" ? ePosts[index].likesCount++ :aPosts[index].likesCount++ ;

      // y.likesCount++;
    }
    isLiked = !isLiked;
     ePosts[index].isLiked =! ePosts[index].isLiked;

    update();
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
