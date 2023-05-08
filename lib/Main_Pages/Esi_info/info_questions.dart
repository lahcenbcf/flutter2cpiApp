import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
import 'package:flluter2cpi/add_post/post_view_mode.dart';
import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adminstrative_qst.dart';
import 'campus.dart';
import 'general_qst.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    var divider = const Divider(
      color: Color.fromRGBO(119, 119, 119, 1),
      indent: 10,
      endIndent: 10,
      height: 1,
    );
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 47, 56, 1),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 90,
          ),
          Center(
            child: Text(
              textScaleFactor: 0.85,
              'Explore,answer or ask what is in your mind...',
              style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 145.h,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => General()));
                    },
                    child: Text(
                      'General questions',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => General()));
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Color.fromRGBO(32, 197, 122, 1))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            divider,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Campus()));
                    },
                    child: Text('Campus questions',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Campus()));
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Color.fromRGBO(32, 197, 122, 1))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            divider,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Administrative()));
                    },
                    child: Text('Administrative questions',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Administrative()));
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Color.fromRGBO(32, 197, 122, 1))
              ],
            )
          ])
        ])));
  }
}
