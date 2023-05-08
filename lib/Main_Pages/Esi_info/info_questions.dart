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
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70, left: 24),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1677741001200-79163963249d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60'),
                  ),
                   SizedBox(
                    width: 42,
                  ),
                  Column(
                    children: [
                      Text(
                        'Esi-community',
                        style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Container(
                          color: Color.fromRGBO(32, 197, 122, 1),
                          child: SizedBox(
                            width: 79.w,
                            height: 3.h,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
            ),
            Column(
              children: [
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                         /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ));*/
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
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => First_prepa()));*/
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
SizedBox(height: 10.h,),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Second_prepa()));*/
                        },
                        child: Text('Campus questions',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () {
                        /*  Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Second_prepa()));*/
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Color.fromRGBO(32, 197, 122, 1))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                        onPressed: () {
                         /* Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => First_cs()));*/
                        },
                        child: Text('Administrative questions',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                    IconButton(
                        onPressed: () {
                          /*Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => First_cs()));*/
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Color.fromRGBO(32, 197, 122, 1))
                  ],
                )
            ])])
  ));}
}