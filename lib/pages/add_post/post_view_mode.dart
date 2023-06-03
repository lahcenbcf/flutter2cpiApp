// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../services/api.dart';
import '../Home_page/home_page_view.dart';
import '../Post-Info/post_info_v.dart';



class Post_Model extends ChangeNotifier {
  File? imageFile;
  String? tag;
  String controllerTag = "";

  //late String pathImage = (imageFile != null) ? imageFile!.path : "";
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  String? messageError;
  String get_title() {
    return title.text;
  }

  String get_des() {
    return description.text;
  }

  addPost(
    String title,
    String desc,
    //
    //File image, //String imagePath,
    String postType,
    BuildContext ctx
  ) async{
    String bytes="";
    if(imageFile!= null){
      bytes=base64.encode(await imageFile!.readAsBytes());
    }else{
      bytes="";
    }
    //Uint8List imageBytes=await imageFile!.readAsBytes();
    String date=DateFormat("yyyy-MM-dd mm:kk").format(DateTime.now());

    var response=await ApiServices.addPost(title, desc,tag!=null ? tag! : "", postType,date,bytes); 
  var result=jsonDecode(response.body);
     if(result?["id"] !=null){
        controllerTag=result["id"];

        addPostUi(date,postType,bytes); 
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        duration: const Duration(milliseconds: 1500),
        content: Text(
          "your post added successufully",
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
    void dispose_text(){
      title.text="";
      description.text="";
    }
  
  addPostUi(String date,String type,String bytes)async{
   
    Post ?p;
    
    if(type == "StuckPosts" || type=="academicPosts" || type=="infoPosts"){
    p = Post(
      links: userInfo!= null ? [userInfo![6], userInfo![5], userInfo![7]] : const ["", "", ""],
      profilePic: userInfo != "" ? (userInfo![8] != "" ? userInfo![8]:"") : "",
      type: type,
      image: bytes,
      likesCount: 0,
      commentsCount: 0,
      title: title.text,
      description: description.text,
      userName: userInfo !=null ? userInfo![0] :"",
      email: userInfo !=null ? userInfo![3] :"",
      tag: tag!,
      comments: [],
      isLiked: false,
      controllerTag: controllerTag,
      isBlack: false,
      isReported: false,
      date: date,
    );
    }
  
    if (type== "StuckPosts") {
      ePosts.insert(0, p!);
     // print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
    } else if (type == "infoPosts") {
      infoPosts.insert(0, p!);
    } else if (type== "academicPosts") {
     // print("wii rani hna");
      aPosts.insert(0, p!);
    } else {
      
      PostInfo o = PostInfo(
          image: bytes, title: title.text, description: description.text, date: date);
      articlePosts.insert(0, o);
    }
    Get.forceAppUpdate();
  }
}
