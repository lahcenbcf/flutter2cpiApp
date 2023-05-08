import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/first_CS/first_cs_year.dart';
import 'package:flluter2cpi/Main_Pages/Academic_years/second_cpi/second_prepa_year.dart';
import 'package:flluter2cpi/Main_Pages/Editing_profile/second_edit_page.dart';
import 'package:flluter2cpi/add_post/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile_1st_screen extends StatefulWidget {
  const Profile_1st_screen({super.key});

  @override
  State<Profile_1st_screen> createState() => _Profile_1st_screenState();
}

class _Profile_1st_screenState extends State<Profile_1st_screen> {
  var divider = const Divider(
    color: Color.fromRGBO(119, 119, 119, 1),
    height: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 47, 56, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          backgroundColor: Color.fromRGBO(35, 47, 56, 1),
          leading: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1677741001200-79163963249d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=60'),
                ),
                SizedBox(
                  height: 8.w,
                ),
                Text(
                  '@username',
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              width: 176.w,
            ),
            TextButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile_2nd_screen()));},
              child: Text(
                'Edit profile',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(32, 197, 122, 1),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 106.h,
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'First name',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              divider,
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Last name',
                    style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 20.h,
              ),
              divider,
              SizedBox(
                height: 29.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Bio',
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 65.h,
              ),
              divider,
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text('E-mail:',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    SizedBox(width: 12.w),
                    Text('user@esi-sba.com',
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
              ),
            ])
      ]),
    );
  }
}
