import 'dart:io';
import 'dart:ui';
import 'package:flluter2cpi/Main_Pages/Academic_years/module_posts.dart';
import 'package:flluter2cpi/Main_Pages/Esi_info/info_posts.dart';
import 'package:flluter2cpi/Main_Pages/Esi_info/info_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
int selcted_tab1 = 0;
class Esi_info extends StatefulWidget {
  const Esi_info({super.key});

  @override
  State<Esi_info> createState() => _Esi_infoState();
}

List<String> title = ['See latest news', 'Esi-community'];
final List<Widget> content = [Info_posts(), Questions()];


class _Esi_infoState extends State<Esi_info> {
  @override
  Widget build(BuildContext context) {
    on_tap_new(int selected) {
      setState(() {
        selcted_tab1 = selected;
      });
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(170.h),
          child: AppBar(
              backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
              title: Column(
                children: [
                  Text(
                    title[selcted_tab1],
                    style: GoogleFonts.inter(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Container(
                      color: const Color.fromRGBO(32, 197, 122, 1),
                      child: SizedBox(
                        width: 79.w,
                        height: 3.h,
                      ))
                ],
              ),
              centerTitle: true,
              bottom: TabBar(
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                indicatorColor: Colors.transparent,
                labelStyle: GoogleFonts.inter(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
                onTap: (x) => on_tap_new(x),
                tabs: [
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, top: 1.h, bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: selcted_tab1 == 0
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: const Tab(
                        text: 'News',
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 40.h),
                      padding: EdgeInsets.only(
                          left: 28.w, right: 28.w, top: 1.h, bottom: 1.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: selcted_tab1 == 1
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: const Tab(
                        text: 'Questions',
                      ))
                ],
              )),
        ),
        body: content[selcted_tab1],
      ),
    );
  }
}
