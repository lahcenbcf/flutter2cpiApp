import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flluter2cpi/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  addPost(String title, String desc, File image, String imagePath,
      String postType) async {
    /*var response=await ApiServices.addPost(title, desc, "younes", tag!, postType, image);
    var result=jsonDecode(response.body);
    if(result?["message"]!=null){
      messageError=result?["message"];
    }else{
      controllerTag=result;
    }
    */
    String formattedDate =
        DateFormat("yyyy-MM-dd kk:mm").format(DateTime.now());
    Uint8List imageBytes = await imageFile!.readAsBytes();
    Post p = Post(
      image: imageFile,
      type: postType,
      likesCount: 0,
      commentsCount: 0,
      title: title,
      description: desc,
      FormattedDate: formattedDate,
      reportCounts: 0,
      userName: "younes",
      email: "y.ferhat@esi-sba.dz",
      tag: tag!,
      comments: [],
      isLiked: false,
      controllerTag: controllerTag,
      pathImage: pathImage,
      isBlack: false,
      isReported: false,
      date: DateTime.now(),
    );
   aPosts.add(p);
   infoPosts.add(p);
    if(postType == "StuckPosts"){
      ePosts.add(p);
    
   
      
        
      }
    
  

      }}