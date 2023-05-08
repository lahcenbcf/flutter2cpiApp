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

import '../../add_post/post_ui.dart';
class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Color.fromRGBO(35, 47, 56, 1),appBar: AppBar(centerTitle: true,backgroundColor: Color.fromRGBO(35, 47, 56, 1),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              title: Column(
                children: [
                  Text(
                    'General q&a',
                    style: GoogleFonts.inter(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ), 
                ],
              ),),floatingActionButton: FloatingActionButton( shape: CircleBorder(side: BorderSide()
           
     ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddPostScreen()))),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(32, 197, 122, 1),
          
        ));
  }
}