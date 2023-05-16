import 'dart:convert';
import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
class MODEL_profile extends ChangeNotifier{
  TextEditingController oldpss=TextEditingController();
  TextEditingController newpass=TextEditingController();
  TextEditingController confirm_new=TextEditingController();
  String?message;

  //String? confirmPasswordValidator(String? confirmPassWord) {
  //   if (oldpss!=) {
  //     return "not the same password";
  //   }
  //   return null;
  // }
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

editPassword(File image,String imagePath)async{
  String imageEncoded=base64Encode(await image.readAsBytes());

  // var response=await ApiServices.editPassword(confirm_new.text,imageEncoded,imagePath);
  // var result=jsonDecode(response.body);
  // if(result?["message"]){
  //   message="repeat again";
  // }else{
  //   message="succces your password updated !";
  // }
}
  

  }