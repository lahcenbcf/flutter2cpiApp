import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flluter2cpi/constants.dart';

import '../../add_post/post_ui.dart';
class Info_posts extends StatefulWidget {
  const Info_posts({super.key});

  @override
  State<Info_posts> createState() => _Info_postsState();
}

class _Info_postsState extends State<Info_posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color.fromRGBO(35, 47, 56, 1),floatingActionButton: FloatingActionButton( shape: CircleBorder(side: BorderSide()
           
     ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddPostScreen()))),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(32, 197, 122, 1),
          
        ) );
  }
}