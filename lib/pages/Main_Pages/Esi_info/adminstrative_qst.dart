//import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
//import 'package:flluter2cpi/add_post/post_view_mode.dart';
//import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post & Comment classes/posts_tags.dart';
import '../../Post/post_v.dart';
//import '../../add_post/post_ui.dart';
//import '../../pages/Post & Comment classes/posts_tags.dart';

class Administrative extends StatefulWidget {
  const Administrative({super.key});

  @override
  State<Administrative> createState() => _AdministrativeState();
}

class _AdministrativeState extends State<Administrative> {
  var info =
      infoPosts.where((element) => element.tag == 'Administrative').toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Column(
          children: [
            Text(
              'Administrative q&a',
              style: GoogleFonts.inter(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: infoPosts
              .where((element) => element.tag == 'Administrative')
              .toList()
              .isNotEmpty
          ? ListView.separated(
              itemBuilder: (BuildContext context, int index) => Post(
                  type: info[index].type,
                  profilePic: info[index].profilePic,
                  likesCount: info[index].likesCount,
                  commentsCount: info[index].commentsCount,
                  image: info[index].image,
                  title: info[index].title,
                  description: info[index].description,
                  date: info[index].date,
                  userName: info[index].userName,
                  email: info[index].email,
                  tag: info[index].tag,
                  comments: info[index].comments,
                  isLiked: info[index].isLiked,
                  controllerTag: info[index].controllerTag,
                  links: info[index].links),
              itemCount: infoPosts
                  .where((element) => element.tag == 'Administrative')
                  .toList()
                  .length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.white,
                  height: 3.h,
                  thickness: 1,
                  endIndent: 15.w,
                  indent: 15.w,
                );
              },
            )
          : Center(
              child: Text(
                'no posts yet',
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
    );
  }
}
