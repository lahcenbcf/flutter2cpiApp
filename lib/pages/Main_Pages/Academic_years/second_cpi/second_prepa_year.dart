// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../../../constants.dart';

import '../../../../constants.dart';
import 'modul_content_2cpi.dart';
class Second_prepa extends StatefulWidget {
  const Second_prepa({super.key});

  @override
  State<Second_prepa> createState() => _Second_prepaState();
}

class _Second_prepaState extends State<Second_prepa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: 
           Row(
             children: [SizedBox(width: 67.w,),
               Text(
                  "2CPI's Modules",
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                
          ),
             ],
           ),
        
      ),
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 125.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize:   MainAxisSize.min,
                children: [
                  Column(
                    children: [
                    
                        
                        Text(
                          'Semester 1',
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      SizedBox(
                        height: 49.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text(
                                'Algebra 3',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Algebra 3',
                                          i: 0,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text(
                                'Analysis 3',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Aanalysis 3',
                                          i: 1,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text(
                                'Archi 2',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Archi 2',
                                          i: 2,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Economie',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Economie',
                                          i: 3,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('English 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'English 2',
                                          i: 4,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('ELECF2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'ELECF2',
                                          i: 5,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('SFSD',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'SFSD',
                                          i: 6,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Proba 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Proba 1',
                                          i: 7,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 53.w,
                  ),
                  Container(
                      color: const Color.fromRGBO(32, 197, 122, 1),
                      child: const SizedBox(height: 434, width: 3)),
                  SizedBox(
                    width: 53.w,
                  ),
                  Column(
                    children: [
                      Text(
                        'Semester 2',
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 49.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Analysis 4',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Analysis 4',
                                          i: 8,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('ISI',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'ISI',
                                          i: 9,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Logique',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Logique',
                                          i: 10,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('English 3',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'English 3',
                                          i: 11,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Optique',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Optique',
                                          i: 12,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('POO',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'POO',
                                          i: 13,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Proba 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_2CPI(
                                          title: 'Proba 2',
                                          i: 14,
                                        ))));
                              })),
                      SizedBox(
                        height: 105.h,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),);
  }
}