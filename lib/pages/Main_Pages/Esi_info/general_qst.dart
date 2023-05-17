// import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
// import 'package:flluter2cpi/Main_Pages/Esi_info/info_posts.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post & Comment classes/posts_tags.dart';
import '../../Post/post_v.dart';

// import '../../add_post/post_ui.dart';
// import '../../pages/Post & Comment classes/posts_tags.dart';
// import '../../pages/Post/post_v.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    List<Post> info=infoPosts.where((element) => element.tag=='General').toList();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: IconButton(
            icon:const Icon(
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
        ),
      ),
      body: info.isNotEmpty
          ? ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                 Post(type:  info[index].type, likesCount:  info[index].likesCount, commentsCount:  info[index].commentsCount, title:  info[index].title, description:  info[index].description, date:  info[index].date, userName:  info[index].userName, email:  info[index].email, tag:  info[index].tag, comments:  info[index].comments, isLiked:  info[index].isLiked, controllerTag:  info[index].controllerTag, links:  info[index].links),
              itemCount:  info.length,
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
