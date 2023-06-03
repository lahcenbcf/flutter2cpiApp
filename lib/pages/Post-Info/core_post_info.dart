import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class CorePostInfo extends StatelessWidget {
  const CorePostInfo(
      {super.key,
      
      required this.title,
      required this.description,
      required this.date, required this.image,});
  final String image;
  final String title;
  final String description;
  final String date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 19.w),
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            child: Icon(
              FluentIcons.arrow_left_48_filled,
              size: 30 * iconSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(25.r * iconSize),
                      child: Image.asset("lib/images/esi.png"),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // userName
                      Text(
                        "Esi Sba",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      //timeAgo
                      Text(
                        Jiffy.parseFromDateTime(DateTime.parse(date)).fromNow(),
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(119, 119, 119, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                description,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 25.h),
            ClipRRect(
                borderRadius: BorderRadius.circular(5).r,
                child: /*Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.medium,
                ),*/
                image =="" ?  Image.network("https://images.unsplash.com/photo-1560169573-5ff6f7f35fe4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=940&q=80"):Image.memory(base64.decode(image)) 
              ) 
            
            ],
          ),
        ),
      ),
    );
  }
}
