// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Post-Info/Post_info_v.dart';

// import '../pages/post-info/post-info.dart';

class Post_Model extends ChangeNotifier {
  String? tag;
  String controllerTag = "";
  File ?imageFile;
  String?pathImage;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController title = TextEditingController();
  String? messageError;
  String get_title() {
    return title.text;
  }

  String get_des() {
    return descriptionController.text;
  }

  addPost(String title, String desc, File image,
      String postType) async {
    // var response=await ApiServices.addPost(title, desc, "younes", tag!, postType, image,imagePath);
    // var result=jsonDecode(response.body);
    // if(result?["message"]!=null){
    //   messageError=result?["message"];
    // }else{
    //   controllerTag=result;
    // }
    
    String formattedDate =
        DateFormat("yyyy-MM-dd kk:mm").format(DateTime.now());
    Uint8List imageBytes = image.readAsBytesSync();
    if(selectedIndex==1 || selectedIndex==2 ||(selectedIndex==3 && postType=="infoPost")){
      //create post of type post
      Post p = Post(
        image: image,
      date: DateTime.now(),
      links: const [],//provides links of user
      type: postType,
      likesCount: 0,
      commentsCount: 0,
      title: title,
      description: desc,
     
      userName: "younes",
      email: "y.ferhat@esi-sba.dz",
      tag: tag!,
      comments:  [],
      isLiked: false,
      controllerTag: controllerTag,
      //pathImage: pathImage,
      isBlack: false,
      isReported: false,
      
    );
    if(postType=="StuckPosts"){
      print("${ePosts.length}" "referre");
      ePosts.add(p);
      print("${ePosts.length}" "referre");
    }else if(postType=="academicPosts"){
      aPosts.add(p);
    }else{
      infoPosts.add(p);
    }
    }
    else{
      //artcle 
      PostInfo x=PostInfo( title: title, description: desc, date: DateTime.now(), image: image,);//pathImage:imagePath
      
      articlePosts.add(x);
    }
   
  

      }}