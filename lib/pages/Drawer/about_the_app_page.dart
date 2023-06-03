import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    const List<List<String>> texts = [
      [
        "",
        "Guide is a mobile app that aims to help ESI-Sba student to find the answers of any question they might have in one of these three categories:"
      ],
      [
        "Technical problems:",
        "Coding problems are the most common in computer engineering field .That's why Esi-flow is available in this app.It offers the students the possibility to explore ,answer and ask any question they have using posts.Other students may answer in the post's comment section."
      ],
      [
        "Academic problems:",
        "Students may also face some difficulties in some academic modules during their Esi journey. Here students can Collaborate on academic challenges and share your knowledge across different areas of study."
      ],
      [
        "News and general concerns:",
        "You can also as an Esi-sba student Know more about what's going on in the Esi community ,Events details, Workshops and many more. Also you can ask for help with administrative and campus-related issues in the Information section."
      ]
    ];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        centerTitle: true,
        title: Text(
          "About the App",
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            FluentIcons.arrow_left_48_filled,
            size: iconSize * 24.0,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 85.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 4; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (i != 0)
                      Text(
                        texts[i][0],
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(32, 197, 122, 1),
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    SizedBox(
                      height: 12.0.h,
                    ),
                    Text(
                      texts[i][1],
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 36.0.h,
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
