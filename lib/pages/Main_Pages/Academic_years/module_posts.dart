// import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Post/post_v.dart';

// import '../../pages/Post/post_v.dart';

class Module_posts extends StatefulWidget {
  const Module_posts(this.tag, {super.key});
  final String tag;
  @override
  State<Module_posts> createState() => _Module_postsState();
}

class _Module_postsState extends State<Module_posts> {
  @override
  Widget build(BuildContext context) {
    List<Post> filteredList = 
        aPosts.where((p) => p.tag == widget.tag).toList();
       
    print("${filteredList.length}  lenght");

    print(widget.tag);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      body: filteredList.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) => Post(type: filteredList[index].type, likesCount: filteredList[index].likesCount, commentsCount: filteredList[index].commentsCount, title: filteredList[index].title, description: filteredList[index].description, date: filteredList[index].date, userName: filteredList[index].userName, email: filteredList[index].email, tag: filteredList[index].tag, comments: filteredList[index].comments, isLiked: filteredList[index].isLiked, controllerTag: filteredList[index].controllerTag, links: filteredList[index].links),
              itemCount: filteredList.length,
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
          : const Text("no posts yet"),
    );
  }
}
