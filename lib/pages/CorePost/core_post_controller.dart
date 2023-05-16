import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/comment_class.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CorePostCotroller extends GetxController {
  Uint8List? image=Uint8List(1000);
  //String?pathImage;
  //String?image;
  final TextEditingController controller = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  List<CommentClass> comments = [];
  String ?commentId;
  String type = "";
  String controllerTag = "";
  String?messageError;
  //
  //
  //I called getComments in post-v to prepare the comments for display 
  getComments(String userName,String postId)async{
    var result=await ApiServices.getComments(userName, postId);
    List<dynamic> listOfComments=jsonDecode(result.body);
    //print(comments);
    if(listOfComments.isNotEmpty){
    comments=listOfComments.map<CommentClass>((c) => CommentClass(userName:c?["author"] , email: "hhhh", comment: c?["text"], likesCount: c?["likes"].length, commentsCount: c?["replys"].length, formattedDate: c?["date"],isLiked: c?["isLiked"],commentId: c?["_id"],profilePic: c?["ProfilePic"],/*pathProfile: c?["pathProfile"],*/links: c?["links"])).toList();
    // search index to push the comments to the post looks for
    //print(comments);
    int idx=getIndex(ePosts);
    if(idx != -1){
     // print("called");
      ePosts[idx].comments=comments;
      //print(ePosts[idx].comments);
      //print(ePosts[idx].commentsCount);
    }
    }
    //print(comments);

    
  }
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

    return i;
  }

  bool checkSpaces() {
    int spaces = 0;
    for (var i = 0; i < controller.text.length; i++) {
      if (controller.text[i] == " ") {
        spaces++;
      }
    }
    return (spaces == controller.text.length);
  }

//add Comment
addComment(String date)async{
  var res=await ApiServices.addComment("lahcen",controllerTag,type,controller.text,date);
  var result=res.body;
  //print(result);
  //I should return the Id of comment added then create a new Comment with this Id 
  if(result!=false){
    commentId=result;//insertedId of the comment
  }
}
  sendComment(BuildContext context) {
    if (controller.text.isEmpty || checkSpaces()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.vertical,
          duration: const Duration(milliseconds: 1500),
          content: Text(
            "you can't add an empty comment",
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      // ignore: non_constant_identifier_names
      String FormattedDate=DateFormat("yyyy-MM-dd kk:mm").format(DateTime.now());
      unitCodeCtrlFocusNode.unfocus();
      var newComment = CommentClass(
        //pathProfile:"" ,
        links: ["","",""], // add the links of the user here and the list should be always of length 3 so if any link is missing just add ""  , link order is linkedin github telegram
        profilePic: null, // if Abouabkr have profile pic then add it
        userName: "Aboubakr", // add the user info here
        email: "email", // and here
        comment: controller.text, // do
        likesCount: 0, // not
        commentsCount: 0, // change
        formattedDate:FormattedDate ,
        commentId: commentId // those
      );
      switch (type) {
        case "StuckPosts":
          int i = getIndex(ePosts);
          ePosts[i].comments.insert(0, newComment); //keep trace
          ePosts[i].commentsCount++;
          break;
        case "academicPosts":
          int i = getIndex(aPosts);
          aPosts[i].comments.insert(0, newComment); //keep trace
          aPosts[i].commentsCount++;

          break;
        default:
          int i = getIndex(infoPosts);
          infoPosts[i].comments.insert(0, newComment); //keep trace
          infoPosts[i].commentsCount++;
      }

      controller.text = "";
      final PostController state = Get.find<PostController>(tag: controllerTag);
      state.commentsCount++; // to update the comment count in the ui

      update();
      //addComment(FormattedDate);
      controller.text = "";
      //addComment();
    }
  }

  //
  //
  //
  onTap(int index,String commentId) {
    //like Comment operation
  likeComment(String commentId,String uid)async{
    var res=await ApiServices.likeComment(commentId, uid);
    var result=jsonDecode(res.body);
    if(result==false){
      messageError="something went wrong repeat again";
    }
  }
    int postNumber = 0;
    
    switch (type) {
      case "StuckPosts":
        postNumber = getIndex(ePosts);
        break;
      case "academicPosts":
        postNumber = getIndex(aPosts);
        break;
      default:
        postNumber = getIndex(infoPosts);
    }
    // parameter index stand for the position of the comment in the post
    if (comments[index].isLiked) {
      switch (type) {
        case "StuckPosts":
          ePosts[postNumber].comments[index].likesCount--;
          break;
        case "academicPosts":
          aPosts[postNumber].comments[index].likesCount--;

          break;
        default:
          infoPosts[postNumber].comments[index].likesCount--;
      }
    } else {
      switch (type) {
        case "StuckPosts":
          ePosts[postNumber].comments[index].likesCount++;
          break;
        case "academicPosts":
          aPosts[postNumber].comments[index].likesCount++;

          break;
        default:
          infoPosts[postNumber].comments[index].likesCount++;
      }
    }
    switch (type) {
      case "StuckPosts":
        ePosts[postNumber].comments[index].isLiked =
            !ePosts[postNumber].comments[index].isLiked;
        break;
      case "academicPosts":
        aPosts[postNumber].comments[index].isLiked =
            !aPosts[postNumber].comments[index].isLiked;

        break;
      default:
        infoPosts[postNumber].comments[index].isLiked =
            !infoPosts[postNumber].comments[index].isLiked;
    }

    //
    //
    //BackEnd here
    likeComment(commentId,"userId");
    //
    //
    update();

  }



// ignore: unused_element
static Future<File> uint8ListToFile(Uint8List bytes)async{
  // Create a temporary file path
  String tempPath=Directory.systemTemp.path;
String tempFileName = 'temp_image.jpg';
String tempFilePath =  "$tempPath/$tempFileName";

File file=File(tempFilePath);
 return await file.writeAsBytes(bytes);
}

  //
  //
  //comments[index].likesCount
  String displayLikes(int index) {
    if (comments[index].likesCount >= 1000000) {
      return "${(comments[index].likesCount / 1000000).toStringAsFixed(1)}m";
    } else if (comments[index].likesCount >= 1000) {
      return "${(comments[index].likesCount / 1000).toStringAsFixed(1)}k";
    }
    return "${comments[index].likesCount}";
  }

  //delete comment
  deleteReportedComment(String commentId)async{
    var response=await ApiServices.deleteReportedComment(commentId,type,controllerTag);
    var result=jsonDecode(response.body);
    if(result?["message"]){
      messageError=result?["message"];
    }
  }

}
