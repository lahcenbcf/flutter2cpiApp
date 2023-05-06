
import 'dart:io';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/comment_class.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CorePostCotroller extends GetxController {
  File? image;
  final TextEditingController controller = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  List<CommentClass> comments = [];
  String type = "";
  String controllerTag = "";
  //
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
      unitCodeCtrlFocusNode.unfocus();
      var newComment = CommentClass(
        profilePic: null, // if Abouabkr have profile pic then add it
        userName: "Aboubakr", // add the user info here
        email: "email",// and here
        comment: controller.text,// do
        likesCount: 0,// not
        commentsCount: 0,// change
        date: DateTime.now(), // those
      );
      if (type == "stack") {
        int i = getIndex(ePosts);
        ePosts[i].comments.insert(0, newComment); //keep trace
        ePosts[i].commentsCount++;
      } else {
        int i = getIndex(aPosts);
        aPosts[i].comments.insert(0, newComment); //keep trace
        aPosts[i].commentsCount++;
      }

      controller.text = "";
      final PostController state = Get.find(tag: controllerTag);
      state.commentsCount++; // to update the comment count in the ui

      update();
    }
  }

  //
  //
  //
  onTap(int index) {
    int postNumber = type == "stack" ? getIndex(ePosts) : getIndex(aPosts);// index of the post
    // parameter index stand for the position of the comment in the post
    if (comments[index].isLiked) {
      
      type == "stack"
          ? ePosts[postNumber].comments[index].likesCount--
          : aPosts[postNumber].comments[index].likesCount--;
    } else {
      
      type == "stack"
          ? ePosts[postNumber].comments[index].likesCount++
          : aPosts[postNumber].comments[index].likesCount++;
    }
    type == "stack"
        ? ePosts[postNumber].comments[index].isLiked =
            !ePosts[postNumber].comments[index].isLiked
        : aPosts[postNumber].comments[index].isLiked =
            !aPosts[postNumber].comments[index].isLiked;

    //
    //
    //BackEnd here
    //
    //
    update();
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
}
