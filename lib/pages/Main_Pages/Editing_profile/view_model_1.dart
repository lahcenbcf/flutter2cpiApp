import 'dart:io';
// import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
// import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
// import 'package:flluter2cpi/Main_Pages/Editing_profile/final_edit_profile.dart';
// import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Model extends ChangeNotifier{
  TextEditingController first=TextEditingController();
  TextEditingController bio=TextEditingController();
    TextEditingController tlg=TextEditingController();
      TextEditingController git=TextEditingController();
        TextEditingController link=TextEditingController();
       String?message;

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
 
  editProfile(File image,String imagePath)async{
    Uint8List imageBytes=await image.readAsBytes();
    // var response=await ApiServices.editProfile(first.text,bio.text,tlg.text,link.text,git.text,imageBytes,imagePath);
    // var result=jsonDecode(response.body);
    // if(result?["message"]){
    //   message="error ,repeat later";
    // }else{
    //   message="your profile data is updated";
    // }
  }

}