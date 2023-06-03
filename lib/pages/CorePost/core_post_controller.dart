import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/comment_class.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/distinct_tags.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../services/api.dart';
import '../Home_page/home_page_view.dart';
import 'components/input.dart';

class CorePostCotroller extends GetxController {
  String? image;
  String? commentId;
  bool isVisited = false;
  final TextEditingController controller = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  List<CommentClass> comments = [];
  String type = "";
  String ?coid;
  String controllerTag = "";
  bool reportIsSuccess=false;
  
  //
  //

  Future<List<CommentClass>> getComments(
      String userName, String postId, String type) async {
    var result = await ApiServices.getComments(userName, postId, type);
    List<dynamic> listOfComments = jsonDecode(result.body);
    //print(comments);
    List<CommentClass> list = [];
    if (listOfComments.isNotEmpty) {
      list = listOfComments
          .map<CommentClass>((c) => CommentClass(
              userName: c?["author"],
              email: "hhhh",
              comment: c?["text"],
              likesCount: c?["likes"].length,
              commentsCount: c?["replys"].length,
              date: c?["date"],
              isLiked: c?["isLiked"],
              commentId: c?["_id"],
              profilePic: c?["profilePic"] != "" ? (c?["profilePic"]) : "",
              isReported: c?["isReported"],
              /*pathProfile: c?["pathProfile"],*/ links: c?["links"]))
          .toList();
      comments = list;
      //int idx=getIndex(ePosts);
      //print("index is $idx");
      //ePosts[idx].comments=list;
    }

    return list;
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
  addComment(String date, String txt, BuildContext ctx) async {
  
    var res = await ApiServices.addComment(
        controllerTag, type, txt, date);
    // if(res.body != null){
      var result=jsonDecode(res.body);
     
      if(result?["id"] != null){
        coid = result["id"];
        /*ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        duration: const Duration(milliseconds: 1500),
        content: Text(
          "your comment added successufully",
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
      }else{
        ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        duration: const Duration(milliseconds: 1500),
        content: Text(
          "failed to add the comment",
          style: GoogleFonts.poppins(
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );*/
      }
    
    // ignore: use_build_context_synchronously
     //insertedId of the comment
  }

  sendComment(BuildContext context) async {
    
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
     Input.hint="posting comment ...";

     Input.isComment=true;
    
      String date=DateFormat("yyyy-MM-dd mm:kk").format(DateTime.now());
 
      String text=controller.text;
      controller.text="";
      await addComment(date,text,context);
      //print(coid);
  
      
      unitCodeCtrlFocusNode.unfocus();
      
      var newComment = CommentClass(
        links:userInfo!= null ? [userInfo![6], userInfo![5], userInfo![7]] : const ["", "", ""], // add the links of the user here and the list should be always of length 3 so if any link is missing just add ""  , link order is linkedin github telegram
        profilePic: userInfo != null ? (userInfo![8] !="" ? userInfo![8] : "") :"", // if Abouabkr have profile pic then add it
        userName: userInfo !=null ? userInfo![0] :"", // add the user info here
        email: userInfo !=null ? userInfo![3] :"", // and here
        comment: text, // do
        likesCount: 0, // not
        commentsCount: 0, // change
        date: date,
        commentId: coid!, // those
      );
      
//print("length${ePosts.length}");
      switch (type) {
        case "StuckPosts":
          int i = getIndex(ePosts);
          ePosts[i].comments.insert(0, newComment); //keep trace
          ePosts[i].commentsCount++;
          //ePosts[i].comments.length++;
          
          update();
          break;

        case "academicPosts":
        
          int i = getIndex(aPosts);
          aPosts[i].comments.insert(0, newComment); //keep trace
          aPosts[i].commentsCount++;
          int l=aPosts[i].comments.length;
          debugPrint("length is $l")
;          //aPosts[i].comments.length++;
     update();
          break;
        default:
          int i = getIndex(infoPosts);
          infoPosts[i].comments.insert(0, newComment); //keep trace
          infoPosts[i].commentsCount++;
          //infoPosts[i].comments.length++;
          update();
      }
      comments.add(newComment);

      /*await Future.delayed(const Duration(seconds: 6), () {
        print(commentId);
        switch (type) {
          case "StuckPosts":
            int i = getIndex(ePosts);
            ePosts[i].comments[0].commentId = coid; //keep trace

            break;
          case "academicPosts":
            int i = getIndex(aPosts);
            aPosts[i].comments[0].commentId = coid; //keep trace

            break;
          default:
            int i = getIndex(infoPosts);
            infoPosts[i].comments[0].commentId = coid; //keep trace
        }
      });*/
    }
    //isVisited=true;
//print("length${ePosts.length}");
    Input.hint="add comment";
    Input.isComment=false;
    

    debugPrint("wiiiiiiiiiiiiiiiiiiii");
    
  }

  //
  //like comment
  likeComment(String commentId) async {
    var res = await ApiServices.likeComment(commentId);
    var result = jsonDecode(res.body);
  }

  //
  onTap(int index,String Coid) {
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
    //
    //
    update();
    likeComment(Coid);
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

  //report post
  reportPost(BuildContext context) async {
   
    var response = await ApiServices.reportPost(controllerTag, type);
    var result = jsonDecode(response.body);
    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.vertical,
          duration: const Duration(milliseconds: 1500),
          content: Text(
            "this post is successufully reported",
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
  // //report comment
  reportComment(String commentId)async{
  var response=await ApiServices.reportComment(commentId);
  var result=jsonDecode(response.body);
  print(result);
  if(result==true){
    reportIsSuccess=true;
  }
  }

}