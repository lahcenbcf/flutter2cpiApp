import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
class MODEL_profile extends ChangeNotifier{
  TextEditingController oldpss=TextEditingController();
  TextEditingController newpass=TextEditingController();
  TextEditingController confirm_new=TextEditingController();
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

  }