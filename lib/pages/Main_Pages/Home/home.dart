import 'package:flluter2cpi/pages/Home_page/home_page_view.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: Text(
              "Coding q&a",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationThickness: 3,
                decorationColor: const Color.fromRGBO(32, 197, 122, 1),
                shadows: [
                  const Shadow(
                    color: Colors.white,
                    offset: Offset(0, -5),
                  )
                ],
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

          Padding(
            padding: const EdgeInsets.only(left: 8.0).w,
            child: InkWell(
              onTap: () {
                selectedIndex = 1;
                Get.forceAppUpdate();
              },
              child: Text(
                "... See more ",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(32, 197, 122, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 13.h),
          //
          LimitedBox(
            maxHeight: 250,
            child: PageView.builder(
              itemCount: ePosts
                  .where((element) => element.isBlack == true)
                  .toList()
                  .length,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 260.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: aPosts[index],
                  ),
                ),
              ),
            ),
          ),
          //
          //
          //
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: Text(
              "Academic q&a",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationThickness: 3,
                decorationColor: const Color.fromRGBO(32, 197, 122, 1),
                shadows: [
                  const Shadow(
                    color: Colors.white,
                    offset: Offset(0, -5),
                  )
                ],
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

          Padding(
            padding: const EdgeInsets.only(left: 8.0).w,
            child: InkWell(
              onTap: () {
                selectedIndex = 2;
                Get.forceAppUpdate();
              },
              child: Text(
                "... See more ",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(32, 197, 122, 1),
                ),
              ),
            ),
          ),
          //
          SizedBox(height: 13.h),
          LimitedBox(
            maxHeight: 260,
            child: PageView.builder(
              itemCount: aPosts
                  .where((element) => element.isBlack == true)
                  .toList()
                  .length,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 260.h,
                  child: Align(
                    alignment: Alignment.center,
                    child: aPosts[index],
                  ),
                ),
              ),
            ),
          ),
          //
          //
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(left: 16).w,
            child: Text(
              "News and Information",
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationThickness: 3,
                decorationColor: const Color.fromRGBO(32, 197, 122, 1),
                shadows: [
                  const Shadow(
                    color: Colors.white,
                    offset: Offset(0, -5),
                  )
                ],
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0).w,
            child: InkWell(
              onTap: () {
                selectedIndex = 3;
                Get.forceAppUpdate();
              },
              child: Text(
                "check for more",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(32, 197, 122, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 13.h),
          LimitedBox(
            maxHeight: 260,
            child: PageView.builder(
              itemCount: infoPosts
                  .where((element) => element.isBlack == true)
                  .toList()
                  .length,
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: SizedBox(
                  height: 260,
                  child: Align(
                    alignment: Alignment.center,
                    child: infoPosts[index],
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
class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.90);
    return PageView.builder(
      itemCount:
          infoPosts.where((element) => element.isBlack == true).toList().length,
      controller: controller,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5).w,
        child: Shimmer.fromColors(
          period: const Duration(seconds: 2),
          baseColor: const Color.fromRGBO(0, 0, 0, 0.8),
          highlightColor: const Color.fromRGBO(0, 0, 0, 0.5),
          child: Container(
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
          ),
        ),
      ),
    );
  }
}
