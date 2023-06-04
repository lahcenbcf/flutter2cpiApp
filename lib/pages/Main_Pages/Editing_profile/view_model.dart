import 'dart:convert';
import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';

import '../../../services/api.dart';
class MODEL_profile extends ChangeNotifier{
  TextEditingController oldpss=TextEditingController();
  TextEditingController newpass=TextEditingController();
  TextEditingController confirm_new=TextEditingController();
  String?message;
  File?imageFile;
      
  String? confirmPasswordValidator(String? confirmPassWord) {
    if (newpass.text!=confirmPassWord ) {
      return "not the same password";
    }
    return null;
  }
 String? confirmold(String? confirmPassWord) {
    if (oldpss.text!=confirmPassWord ) {
      return "not the same password";
    }
    return null;
  }

editPassword(/*File image,String imagePath*/)async{
  //String imageEncoded=base64Encode(await image.readAsBytes());
  String bytes="";
  if(imageFile != null){
    bytes=base64.encode(imageFile!.readAsBytesSync());
    userInfo![8]=bytes;
      }
   var response=await ApiServices.editPassword(confirm_new.text/*imageEncoded,imagePath*/,bytes);
   var result=jsonDecode(response.body);
   if(result==true){
    message="succces your password updated !";
   
     
   }else{
     message="repeat again";}
     await SharedPrefService.pref.setStringList('loginInfo',userInfo!);
}
  

  }