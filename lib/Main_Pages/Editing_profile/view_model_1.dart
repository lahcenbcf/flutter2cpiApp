import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
import 'package:flluter2cpi/Main_Pages/Editing_profile/final_edit_profile.dart';
import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class Model extends ChangeNotifier{
  TextEditingController first=TextEditingController();
  TextEditingController bio=TextEditingController();
    TextEditingController tlg=TextEditingController();
      TextEditingController git=TextEditingController();
        TextEditingController link=TextEditingController();

  String? validate(String? val){
    
    if(val!=null && val.length<5){return 'the name is too short ';}
    if(val!=null &&val.isEmpty){return 'please enter a name ';}
  }
  String? validat_bio(String? val){
    
    if(val!=null && val.length<5|| val!=null &&val.length>100){return ' the size of the bio is too short';}
    if(val!=null &&val.length>100){return ' the size of the bio is too big';}
     if(val!=null &&val.isEmpty){return 'please enter a bio';}
  }

}