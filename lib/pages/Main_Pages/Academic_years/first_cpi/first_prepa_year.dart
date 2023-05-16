// import 'package:flluter2cpi/Main_Pages/Academic_years/first_cpi/module_content.dart';
// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flluter2cpi/pages/Main_Pages/Academic_years/first_cpi/module_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class First_prepa extends StatefulWidget {
  const First_prepa({super.key});

  @override
  State<First_prepa> createState() => _First_prepaState();
}

class _First_prepaState extends State<First_prepa> {
  TextStyle kmodules =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            
             children: [
              SizedBox(width: 67.w),
               Text(
                  "1CPI's Modules",
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
                mainAxisSize: MainAxisSize.min,
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
                                'Algebra 1',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Algebra 1',
                                          index: 0,
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
                                'ALSDS',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'ALSDS',
                                          index: 1,
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
                                'Analysis 1',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Analysis 1',
                                          index: 2,
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
                              child: Text('Archi 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Archi 1',
                                          index: 3,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('BWEB',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'BWEB',
                                          index: 4,
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
                              child: Text('ELEC',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'ELECT',
                                          index: 5,
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
                              child: Text('SYST 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'SYST 1',
                                          index: 6,
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
                              child: Text('TEE',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'TEE',
                                          index: 7,
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
                              child: Text('ALgebra 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Algebra 2',
                                          index: 8,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        width: 114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('ALSDD',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'ALSDD',
                                          index: 9,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Analysis 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Analysis 2',
                                          index: 10,
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
                              child: Text('FELECT 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'FELECT 1',
                                          index: 11,
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
                              child: Text('English 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'English 1',
                                          index: 12,
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
                              child: Text('Mechanics',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'Mechanics',
                                          index: 13,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
width:114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('SYST 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content(
                                          title: 'SYST 2',
                                          index: 14,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        width: 114,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(205, 205, 205, 1)),
                        child: TextButton(
                          child: Text('TEO',
                              style: GoogleFonts.inter(textStyle: kmodules)),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => const Module_content(
                                      title: 'TEO',
                                      index: 15,
                                    ))));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
