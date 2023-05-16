import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Post & Comment classes/posts_tags.dart';
import '../Post/post_v.dart';

class LikedPosts extends StatefulWidget {
  const LikedPosts({super.key});

  @override
  State<LikedPosts> createState() => _LikedPostsState();
}

class _LikedPostsState extends State<LikedPosts> {
  PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    List<String> title = ["Esi Flow", "Academeic", "Information"];
    List<List<Post>> likedPosts = [
      ePosts
          .where((element) =>
              element.isLiked == true && element.isReported == false)
          .toList(),
      aPosts
          .where((element) =>
              element.isLiked == true && element.isReported == false)
          .toList(),
      infoPosts
          .where((element) =>
              element.isLiked == true && element.isReported == false)
          .toList(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        centerTitle: true,
        title: Text(
          "My Liked Posts",
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            FluentIcons.arrow_left_48_filled,
            size: iconSize * 24.0,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
      body: PageView.builder(
          itemCount: 3,
          controller: controller,
          itemBuilder: (context, i) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (i != 0)
                        InkWell(
                          onTap: () => controller.animateToPage(
                            i - 1,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.fastOutSlowIn,
                          ),
                          child: Icon(
                            FluentIcons.chevron_left_48_filled,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            size: 22 * iconSize,
                          ),
                        ),
                      SizedBox(width: 17.0.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0.h, horizontal: 22.0.w),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(32, 197, 122, 1),
                            borderRadius: BorderRadius.circular(20).r),
                        child: Text(
                          title[i],
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(width: 17.0.w),
                      if (i != 2)
                        InkWell(
                          onTap: () => controller.animateToPage(
                            i + 1,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.fastOutSlowIn,
                          ),
                          child: Icon(
                            FluentIcons.chevron_right_48_filled,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            size: 22 * iconSize,
                          ),
                        ),
                    ],
                  ),
                  likedPosts[i].isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                            itemCount: likedPosts[i].length,
                            itemBuilder: (context, index) =>
                                likedPosts[i][index].isBlack
                                    ? Post(
                                      reportCounts: likedPosts[i][index].reportCounts,
                                      //pathImage: likedPosts[i][index].pathImage,
                                      profilePic: likedPosts[i][index].profilePic,
                                      image: likedPosts[i][index].image,
                                      links: likedPosts[i][index].links,
                                      isReported:likedPosts[i][index].isReported,
                                        type: likedPosts[i][index].type,
                                        likesCount:
                                            likedPosts[i][index].likesCount,
                                        commentsCount:
                                            likedPosts[i][index].commentsCount,
                                        title: likedPosts[i][index].title,
                                        description:
                                            likedPosts[i][index].description,
                                        FormattedDate: likedPosts[i][index].FormattedDate,
                                        userName: likedPosts[i][index].userName,
                                        email: likedPosts[i][index].email,
                                        tag: likedPosts[i][index].tag,
                                        comments: likedPosts[i][index].comments,
                                        isLiked: likedPosts[i][index].isLiked,
                                        controllerTag:
                                            likedPosts[i][index].controllerTag,
                                        isBlack: false,
                                      )
                                    : likedPosts[i][index],
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.white,
                              height: 3.h,
                              thickness: 1,
                              endIndent: 15.w,
                              indent: 15.w,
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3),
                          child: Center(
                            child: Text(
                              "You have not liked any post yet",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                ],
              )),
    );
  }
}
