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
class Esi_info extends StatefulWidget {
  const Esi_info({super.key, required this.index, required this.title});
final int index;
final String title;
int get_index(){return index;}
  @override
  State<Esi_info> createState() => _Esi_infoState();
}
final List<List<Widget>> content = [[Info_posts(),Questions()]];
int selcted_tab = 0;

class _Esi_infoState extends State<Esi_info> {
  @override
  Widget build(BuildContext context) {
     on_tap_new(int selected) {
      setState(() {
        selcted_tab = selected;
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
                    widget.title,
                    style: GoogleFonts.inter(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ), Container(
                          color: const Color.fromRGBO(32, 197, 122, 1),
                          child: SizedBox(
                            width: 79.w,
                            height: 3.h,
                          ))
                ],
              ),
              centerTitle: true,
              bottom: TabBar(dividerColor: Colors.transparent,
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
                        color: selcted_tab == 0
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
                        color: selcted_tab == 1
                            ? const Color.fromRGBO(32, 197, 122, 1)
                            : Colors.white,
                      ),
                      child: const Tab(
                        text: 'Questions',
                      ))
                ],
              )),
        ),
        body: content[widget.index][selcted_tab],
      ),
    );
  }
}