// import 'package:flluter2cpi/add_post/post_view_mode.dart';
// import 'package:flluter2cpi/add_post/select_tag_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../../constants.dart';
import '../../../../constants.dart';
import 'module_content_1CS.dart';
class First_cs extends StatefulWidget {
  const First_cs({super.key});

  @override
  State<First_cs> createState() => _First_csState();
}

class _First_csState extends State<First_cs> {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(appBar: AppBar(
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
             children: [SizedBox(width: 70.w),
               Text(
                  "1CS's Modules",
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
          child: Column(mainAxisSize: MainAxisSize.min,
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
                        height: 30.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text(
                                'SYST1 (1CS)',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'SYST1 (1CS)',
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
                                'Resaux 1',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Resaux 1',
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
                                'IGL',
                                style: GoogleFonts.inter(textStyle: kmodules),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'IGL',
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
                              child: Text('BDD',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'BDD',
                                          i: 3,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Th langages',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Th langages',
                                          i: 4,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('A numérique',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'A numérique',
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
                              child: Text('RO',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'RO',
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
                              child: Text('English 1',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'English 1',
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
                      child: const SizedBox(height: 550, width: 3)),
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
                        height: 30.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('SYST2 (1CS)',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'SYST2 (1CS)',
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
                              child: Text('Resaux 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Resaux 2',
                                          i: 9,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Archi évoulué',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Archi évoulué',
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
                              child: Text('Analyse SI',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Analyse SI',
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
                              child: Text('WEB',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'WEB',
                                          i: 12,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Intro à la sécurité',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Intro à la sécurité',
                                          i: 13,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Gestion de projet',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Gestion de projet',
                                          i: 14,
                                        ))));
                              })),
                      SizedBox(
                        height: 24.h,
                      ),Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(205, 205, 205, 1)),
                          child: TextButton(
                              child: Text('Langue Anglaise 2',
                                  style: GoogleFonts.inter(textStyle: kmodules)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const Module_content_1CS(
                                          title: 'Langue Anglaise 2',
                                          i: 14,
                                        ))));
                              })),SizedBox(height: 30.h,)
                      
                    ],
                  ),
                  
                ],
              ),
            ],
          
          ),
        )
      ) );*/
     
return Scaffold(appBar: AppBar( 
        backgroundColor: Color.fromRGBO(35, 47, 56, 1), 
        leading: IconButton( 
          icon: Icon( 
            Icons.arrow_back, 
            color: Colors.white, 
          ), 
          onPressed: () { 
            Navigator.of(context).pop(); 
          }, 
        ), 
        title:  
           Row( 
             children: [SizedBox(width: 70.w), 
               Text( 
                  "1CS's Modules", 
                  style: GoogleFonts.inter( 
                      fontSize: 20.sp, 
                      fontWeight: FontWeight.w800, 
                      color: Colors.white), 
                 
          ), 
             ], 
           ), 
         
      ), 
      backgroundColor: Color.fromRGBO(35, 47, 56, 1), 
      body: SingleChildScrollView( 
        child: Center( 
          child: Column( 
            children: [ 
               
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
                            fontSize: 20.sp, 
                            fontWeight: FontWeight.w700, 
                            color: Colors.white), 
                      ), 
                      SizedBox( 
                      height: 49.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text( 
                                'SYST1 (1CS)', 
                                style: GoogleFonts.inter(textStyle: kmodules), 
                              ), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'SYST1 (1CS)', 
                                          i: 0, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text( 
                                'Resaux 1', 
                                style: GoogleFonts.inter(textStyle: kmodules), 
                              ), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Resaux 1', 
                                          i: 1, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text( 
                                'IGL', 
                                style: GoogleFonts.inter(textStyle: kmodules), 
                              ),


onPressed:

() { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'IGL', 
                                          i: 2, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('BDD', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'BDD', 
                                          i: 3, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Th langages', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Th langages', 
                                          i: 4, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('A numérique', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'A numérique', 
                                          i: 5, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('RO', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'RO', 
                                          i: 6, 
                                        )))); 
                              })), 
                      SizedBox(


height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('English 1', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'English 1', 
                                          i: 7, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 55.h, 
                      ), 
                    ], 
                  ), 
                 SizedBox( 
                    width: 53.w, 
                  ), 
                  Container( 
                      color: Color.fromRGBO(32, 197, 122, 1), 
                      child: SizedBox(height: 434, width: 3)), 
                  SizedBox( 
                    width: 53.w, 
                  ),  
                  Column( 
                    children: [ 
                                              SizedBox(height:80.h), 
                      Text( 
                        'Semester 2', 
                        style: GoogleFonts.inter( 
                            fontSize: 20.sp, 
                            fontWeight: FontWeight.w700, 
                            color: Colors.white), 
                      ), 
                       SizedBox( 
                        height: 49.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('SYST2 (1CS)', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'SYST2 (1CS)', 
                                          i: 8, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Resaux 2', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Resaux 2', 
                                          i: 9, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Archi évoulué',


style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Archi évoulué', 
                                          i: 10, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Analyse SI', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Analyse SI', 
                                          i: 11, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('WEB', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'WEB', 
                                          i: 12, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Intro à la sécurité', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Intro à la sécurité', 
                                          i: 13, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ), 
                      Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Gestion de projet', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Gestion de projet',


i: 14, 
                                        )))); 
                              })), 
                      SizedBox( 
                        height: 24.h, 
                      ),Container(width:114.w, 
                          decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(8), 
                              color: Color.fromRGBO(205, 205, 205, 1)), 
                          child: TextButton( 
                              child: Text('Langue Anglaise 2', 
                                  style: GoogleFonts.inter(textStyle: kmodules)), 
                              onPressed: () { 
                                Navigator.of(context).push(MaterialPageRoute( 
                                    builder: ((context) => Module_content_1CS( 
                                          title: 'Langue Anglaise 2', 
                                          i: 14, 
                                        )))); 
                              })),SizedBox(height: 105.h,) 
                       
                    ], 
                  ), 
                   
                ], 
              ), 
            ], 
           
          ), 
        ) 
      ) );

  }
}