import 'dart:convert';
import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/final_edit_profile.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/services/sharedServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/api.dart';
class Model extends ChangeNotifier{
  TextEditingController first=TextEditingController();
  TextEditingController bio=TextEditingController();
    TextEditingController tlg=TextEditingController();
      TextEditingController git=TextEditingController();
        TextEditingController link=TextEditingController();
       String?message;
File?imageFile;
      
  String? validate(String? val){
    
    if(val!=null && val.length<5){return 'the name is too short ';}
    if(val!=null &&val.isEmpty){return 'please enter a name ';}
    return null;
  }
  String? validat_bio(String? val){
    
    if(val!=null && val.length<5|| val!=null &&val.length>100){return ' the size of the bio is too short';}
    if(val!=null &&val.length>100){return ' the size of the bio is too big';}
     if(val!=null &&val.isEmpty){return 'please enter a bio';}
     return null;
  }
 
 disposeInputs(){
  tlg.text="";
  link.text="";
  git.text="";
  first.text="";
 }
  editProfile()async{print("message");
  String bytes="";
    //Uint8List imageBytes=await image.readAsBytes();
  if(imageFile != null){
    bytes=base64.encode(imageFile!.readAsBytesSync());
    userInfo![8]=bytes;
  }
    var response=await ApiServices.editProfile(first.text,bio.text,tlg.text,link.text,git.text,bytes);
     var result=jsonDecode(response.body);
    if(result==true){
      message="your profile data is updated";
      userInfo![2]=first.text;
       userInfo![5]=git.text;
        userInfo![6]=link.text;
         userInfo![7]=tlg.text;
          userInfo![9]=bio.text;
        await SharedPrefService.pref.setStringList("loginInfo",userInfo!);
     }else{
       message="error ,repeat later";
     }
  }

}