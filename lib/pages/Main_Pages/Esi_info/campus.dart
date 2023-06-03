// import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flluter2cpi/pages/Post/post_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post & Comment classes/posts_tags.dart';
// import '../../add_post/post_ui.dart';
// import '../../pages/Post & Comment classes/posts_tags.dart';

class Campus extends StatefulWidget {
  const Campus({super.key});

  @override
  State<Campus> createState() => _CampusState();
}

class _CampusState extends State<Campus> {
  var info = infoPosts.where((element) => element.tag=='Campus').toList();
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
              'Campus q&a',
              style: GoogleFonts.inter(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: infoPosts.where((element) => element.tag=='Campus').toList().isNotEmpty
          ? ListView.separated(
                 
              itemBuilder: (BuildContext context, int index) => Post(type:  info[index].type, likesCount:  info[index].likesCount, commentsCount:  info[index].commentsCount, title:  info[index].title, description:  info[index].description, date:  info[index].date, userName:  info[index].userName, email:  info[index].email, tag:  info[index].tag, comments:  info[index].comments, isLiked:  info[index].isLiked, controllerTag:  info[index].controllerTag, image: info[index].image,links:  info[index].links,profilePic: info[index].profilePic,),
              itemCount: infoPosts.where((element) => element.tag=='Campus').toList().length,
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
          : const Text('no posts yet'),
    );
  }
}
