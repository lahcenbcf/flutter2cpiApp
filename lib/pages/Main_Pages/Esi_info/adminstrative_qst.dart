//import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
//import 'package:flluter2cpi/add_post/post_view_mode.dart';
//import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Post & Comment classes/posts_tags.dart';
//import '../../add_post/post_ui.dart';
//import '../../pages/Post & Comment classes/posts_tags.dart';

class Administrative extends StatefulWidget {
  const Administrative({super.key});

  @override
  State<Administrative> createState() => _AdministrativeState();
}

class _AdministrativeState extends State<Administrative> {
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
      body: infoPosts.where((element) => element.tag=='Administrative').toList().isNotEmpty
          ? ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                  infoPosts.where((element) => element.tag=='Administrative').toList()[index],
              itemCount: infoPosts.where((element) => element.tag=='Administrative').toList().length,
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
