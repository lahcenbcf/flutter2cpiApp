
import 'dart:io';
import 'dart:math';

import 'package:flluter2cpi/pages/CorePost/components/profile_icon.dart';
import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import '../CorePost/components/Image/display_image.dart';
import '../CorePost/core_post_v.dart';
import 'components/buttons.dart';
import '../Post & Comment classes/comment_class.dart';
import 'components/title_description.dart';
import 'post_controller.dart';

class Post extends StatelessWidget {
  Post({
    super.key,
    required this.type, // stack or academic
    required this.likesCount,
    required this.commentsCount,
    required this.title,
    required this.description,
    required this.date,
    required this.userName,
    required this.email,
    required this.tag,
    required this.comments,
    required this.isLiked,
    required this.controllerTag,
    this.image,
    this.profilePic,
     this.isBlack = false,
    this.isReported = false,
    required this.links,
  });
  final List<String> links;
  bool isReported;
  final File? image;
  final File? profilePic;
  final String type;
  final String title;
  final String description;
  final String userName; // the name of the user that create the post
  final String email;
  final String tag;
  int likesCount;
  int commentsCount;
  final DateTime date;
  final List<CommentClass> comments;
   bool isBlack;
  bool
      isLiked; //check if the user that is logged in, has liked this post before so i just need true or false value
  final String controllerTag;

  // every post should have a distinct controllerTag in order to have his own state,otherwise the posts that hold the same tagController will share the same state of likeButton
  @override
  Widget build(BuildContext context) {
    //
    var generatedColor = Random().nextInt(Colors.primaries.length);
    final postController =
        Get.put<PostController>(PostController(), tag: controllerTag);
    final corePostCotroller =
        Get.put<CorePostCotroller>(CorePostCotroller(), tag: controllerTag);
    //init the comments of the post
    corePostCotroller.comments = comments;
    corePostCotroller.type = type;
    corePostCotroller.controllerTag = controllerTag;
    corePostCotroller.image = image;
    // inint the controller
    postController.type = type;
    postController.likesCount = likesCount;
    postController.commentsCount = commentsCount;
    postController.controllerTag = controllerTag;
    postController.isLiked = isLiked;
    postController.profilePic = profilePic; // this is the profile pic of the post maker

    @override
    navigatToPostCore() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return PostCore(
              links: links,
              title: title,
              description: description,
              date: date,
              userName: userName,
              email: email,
              tag: tag,
              comments: comments,
              generatedColor: generatedColor,
              controllerTag: controllerTag,
              isReported: isReported,
            );
          },
        ),
      );
    }

    //
    //

    //

    //
    //
    //

    return isBlack
        ? Container(
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
                          ProfileIcon(
                            links: links,
                            userName: userName,
                            email: email,
                            controllerTag: controllerTag,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 36.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(32, 197, 122, 1),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 13.h),

                // for the title
                GestureDetector(
                  onTap: navigatToPostCore,
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
                        padding: EdgeInsets.only(left: 25.w, right: 6.w),
                        child: TitleDescription(text: description, size: 13),
                      ),
                    ],
                  ),
                ),
                //for the buttons
                SizedBox(height: 13.h),
                Buttons(
                  navigatToPostCore: navigatToPostCore,
                  controllerTag: controllerTag,
                  isBlack: isBlack,
                  isReported: isReported,
                ),
                SizedBox(height: 4.h),
              ],
            ),
          )
        : GestureDetector(
            onTap: navigatToPostCore,
            child: Container(
              margin: const EdgeInsets.all(5).w,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.w, 
                  right: 16.w,
                  bottom: 16.h,
                  top: 16.h,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //
                      //for user name and profile icon and the more icon
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ProfileIcon(
                                links: links,
                                userName: userName,
                                email: email,
                                controllerTag: controllerTag,
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
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  //timeAgo
                                  Text(
                                    Jiffy.parseFromDateTime(date).fromNow(),
                                    style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(
                                          119, 119, 119, 1),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      //
                      //for the title
                      //
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 45.h),
                      //
                      //for the description
                      //
                      TitleDescription(text: description, size: 15),

                      //
                      SizedBox(height: 20.h),
                      if (image != null)
                        InkWell(
                          onTap: () {
                            navigatToPostCore();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayImage(
                                  controllerTag: controllerTag,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "check photo",
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(32, 197, 122, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
