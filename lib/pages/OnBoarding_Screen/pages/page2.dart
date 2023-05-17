import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 44.0.h),
        SizedBox(
          height: 39.h,
          width: 170.w,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("lib/images/white.png"),
          ),
        ),
        SizedBox(height: 55.0.h),
        SizedBox(
          height: 268.h,
          width: 353.w,
          child: SvgPicture.asset("lib/images/pic2.svg"),
        ),
        
        SizedBox(height: 67.0.h),
        Text(
          
          "Ask, answer and learn in Esi-flow.there where you can solve all your coding problems and progress in your programming coursework.",
       textAlign: TextAlign.justify,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 60.0.h),
        
      ],
    );
  }
}