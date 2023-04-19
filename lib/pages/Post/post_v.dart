import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'components/buttons.dart';
import 'components/title_description.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.likes,
    required this.comments,
    required this.title,
    required this.description,
    required this.date,
    required this.userName,
    required this.email,
    required this.tag,
  });
  final String title;
  final String description;
  final String userName;
  final String email;
  final String tag;
  final int likes;
  final int comments;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    int lineCount = 0;
    var generatedColor = Random().nextInt(Colors.primaries.length);
    //
    //
    //
    //
    
    return Container(
    width: 360.w,
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
        //  crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          // for the user name and timeAgo and tag and profile picture
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 14).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // profile picture
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 23 * iconSize,
                      backgroundColor: Colors.primaries[generatedColor],
                      child: Text(
                        userName[0].toUpperCase() + email[0].toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // userName
                        Text(
                          "@$userName",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 10.5.sp,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        //timeAgo
                        Text(
                          Jiffy.parseFromDateTime(date).fromNow(),
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(119, 119, 119, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 9.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //Tag

                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(32, 197, 122, 1),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.h),

          // for the title
          GestureDetector(
            onTap: () {
              print("hello");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //  color: Colors.amber,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 25).w,
                  child: TitleDescription(text: title, size: 16),
                ),
          
                SizedBox(height: 10.h),
                //for the description
                Padding(
                    padding:  EdgeInsets.only(left: 25.w,right: 6.w),
                    child: TitleDescription(text: description, size: 13),
                  ),
               
              ],
            ),
          ),
          //for the buttons
          SizedBox(height: 13.h),
          Buttons(
            iconSize: iconSize,
            likes: likes,
            comments: comments,
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
