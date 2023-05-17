// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Post-Info/Post_info_v.dart';

class Post_Model extends ChangeNotifier {
  File? imageFile;
  String? tag;
  String controllerTag = "";
  late String pathImage = (imageFile != null) ? imageFile!.path : "";
  TextEditingController descriptionController = TextEditingController();
  TextEditingController title = TextEditingController();
  String? messageError;
  String get_title() {
    return title.text;
  }

  String get_des() {
    return descriptionController.text;
  }

  addPost(
      String title,
      String desc,
      File image, //String imagePath,
      String postType) {
    /*var response=await ApiServices.addPost(title, desc, "younes", tag!, postType, image); 
    var result=jsonDecode(response.body); 
    if(result?["message"]!=null){ 
      messageError=result?["message"]; 
    }else{ 
      controllerTag=result; 
    } 
    */
    //String formattedDate =
    //  DateFormat("yyyy-MM-dd kk:mm").format(DateTime.now());
    // Uint8List imageBytes = await imageFile!.readAsBytes();
    Post p = Post(
      links: const ["", "", ""],
      image: imageFile,
      type: postType,
      likesCount: 0,
      commentsCount: 0,
      title: title,
      description: desc,
      userName: "younes",
      email: "y.ferhat@esi-sba.dz",
      tag: tag!,
      comments: [],
      isLiked: false,
      controllerTag: controllerTag,
      isBlack: false,
      isReported: false,
      date: DateTime.now(),
    );

    if (postType == "StuckPosts") {
      ePosts.add(p);
      print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    } else if (postType == "infoPosts") {
      infoPosts.add(p);
    } else if (postType == "academicPosts") {
      aPosts.add(p);
    } else {
      PostInfo o = PostInfo(
          image: image, title: title, description: desc, date: DateTime.now());
      articlePosts.add(o);
    }
    Get.forceAppUpdate();
  }
}
