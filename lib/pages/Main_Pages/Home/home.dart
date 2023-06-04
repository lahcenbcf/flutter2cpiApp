
import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post/post_v.dart';
import 'display_followed_tags.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    //
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.9);

    //
    List<Post> e = ePosts.where((element) => !element.isReported).toList();
    List<Post> a = aPosts.where((element) => !element.isReported).toList();
    List<Post> i = infoPosts.where((element) => !element.isReported).toList();
//print(followedTags);
    //
    //
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          // followed tags
          Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: Text(
              "Following",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(left: 8.0).w,
            child: SizedBox(
              height: 35.h,
              child: followedTags.isNotEmpty
                  ? const DisplayFollowedTags()
                  : Text(
                      "you didn't follow any tag yet",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: const Color.fromRGBO(32, 197, 122, 1)),
            margin: const EdgeInsets.only(left: 16).w,
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
            child: Text(
              "Coding q&a",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          Padding(
            padding: const EdgeInsets.only(left: 12).w,
            child: Text(
              "Latest posts concerning coding problems",
              style: GoogleFonts.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          //
          LimitedBox(
            maxHeight: 300.0.h,
            child: PageView.builder(
              itemCount:e.length>4 ?  4 : e.length+1 ,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 300.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: (e.length>4 ? index != 3 : index!=e.length ) 
                      ?Post(
                            type: e[index].type,
                            image: e[index].image,
                            profilePic: e[index].profilePic,
                            likesCount: e[index].likesCount,
                            commentsCount: e[index].commentsCount,
                            title: e[index].title,
                            description: e[index].description,
                            date: e[index].date,
                            userName: e[index].userName,
                            email: e[index].email,
                            tag: e[index].tag,
                            comments: e[index].comments,
                            isLiked: e[index].isLiked,
                            controllerTag: e[index].controllerTag,
                            isBlack: true,
                            links: e[index].links)  // ?  ePosts.where((element) => !element.isReported).toList()[index]
                        : InkWell(
                            onTap: () {
                              selectedIndex = 1;
                              Get.forceAppUpdate();
                            },
                            child: Text(
                              "... See more ",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(32, 197, 122, 1),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          //
          //
          //
          SizedBox(height: 25.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                color: const Color.fromRGBO(32, 197, 122, 1)),
            margin: const EdgeInsets.only(left: 16).w,
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
            child: Text(
              "Academic q&a",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          Padding(
            padding: const EdgeInsets.only(left: 12).w,
            child: Text(
              "Latest posts in the academic field ",
              style: GoogleFonts.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          //

          LimitedBox(
            maxHeight: 300.0.h,
            child: PageView.builder(
              itemCount: a.length>4 ?  4 : a.length+1 ,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 300.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: (a.length>4 ? index != 3 : index!=a.length ) 
                        ? Post(
                            type: a[index].type,
                            likesCount: a[index].likesCount,
                            image: a[index].image,
                            commentsCount: a[index].commentsCount,
                            title: a[index].title,
                            description: a[index].description,
                            date: a[index].date,
                            userName: a[index].userName,
                            email: a[index].email,
                            profilePic: a[index].profilePic,
                            tag: a[index].tag,
                            comments: a[index].comments,
                            isLiked: a[index].isLiked,
                            controllerTag: a[index].controllerTag,
                            isBlack: true,
                            links: a[index].links)
                        : InkWell(
                            onTap: () {
                              selectedIndex = 2;
                              Get.forceAppUpdate();
                            },
                            child: Text(
                              "... See more ",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(32, 197, 122, 1),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          //
          //
          SizedBox(height: 25.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: const Color.fromRGBO(32, 197, 122, 1)),
            margin: const EdgeInsets.only(left: 16).w,
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 16.0.w),
            child: Text(
              "News and Information",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          Padding(
            padding: const EdgeInsets.only(left: 12).w,
            child: Text(
              "Check more news in the Esi community",
              style: GoogleFonts.poppins(
                fontSize: 15.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          LimitedBox(
            maxHeight: 300.0.h,
            child: PageView.builder(
              itemCount:i.length>4 ?  4 : i.length+1,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 260,
                  child: Align(
                    alignment: Alignment.center,
                    child: (i.length>4 ? index != 3 : index!=i.length ) 
                        ? Post(
                            type: i[index].type,
                            image: i[index].image,
                            profilePic: i[index].profilePic,
                            likesCount: i[index].likesCount,
                            commentsCount: i[index].commentsCount,
                            title: i[index].title,
                            description: i[index].description,
                            date: i[index].date,
                            userName: i[index].userName,
                            email: i[index].email,
                            tag: i[index].tag,
                            comments: i[index].comments,
                            isLiked: i[index].isLiked,
                            controllerTag: i[index].controllerTag,
                            isBlack: true,
                            links: i[index].links,
                          )
                        : InkWell(
                            onTap: () {
                              selectedIndex = 3;
                              Get.forceAppUpdate();
                            },
                            child: Text(
                              "check for more",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(32, 197, 122, 1),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PageView.builder(
//               itemCount: infoPosts
//                   .where((element) => element.isBlack == true)
//                   .toList()
//                   .length,
//               controller: controller,
//               physics: const BouncingScrollPhysics(),
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5).w,
//                 child: infoPosts[index],
//               ),
//             ),

