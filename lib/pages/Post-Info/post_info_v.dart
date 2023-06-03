import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flluter2cpi/pages/Post-Info/core_post_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.date
  });
  final String image;
  final String title;
  final String description;
  final String date;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CorePostInfo(
              title: title,
              description: description,
              date: date,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
            colors: [
              Color.fromRGBO(0, 0, 0, 0.73),
              Color.fromRGBO(30, 30, 30, 0.73),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5).r,
                  child: SizedBox(
                    height: 90.h,
                    width: 160.w,
                    child: /*Image.file(
                      /*File(image!.path),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,*/
                     MemoryImage(image)*/
                     image =="" ?  Image.network("https://images.unsplash.com/photo-1560416313-414b33c856a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"):Image.memory(base64.decode(image)) 
                    ,
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title.length > 47
                              ? title.substring(0, 39)
                              : title,
                          style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        if (title.length > 47)
                          TextSpan(
                            text: "  ...Show",
                            style: GoogleFonts.poppins(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 255, 255, 0.38),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: description.length > 370
                        ? description.substring(0, 330)
                        : description,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  if (description.length > 370)
                    TextSpan(
                      text: "    ...Show",
                      style: GoogleFonts.poppins(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 0.38),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            // time ago
            Padding(
              padding: const EdgeInsets.only(left: 17).w,
              child: Text(
                Jiffy.parseFromDateTime(DateTime.parse(date)).fromNow(),
                style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
