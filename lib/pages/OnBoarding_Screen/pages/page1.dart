import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 55.0.h),
        SizedBox(
          height: 39.h,
          width: 170.w,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SvgPicture.asset("lib/images/w.svg"),
          ),
        ),
        SizedBox(height: 55.0.h),
        SizedBox(
          height: 268.h,
          width: 353.w,
          child: SvgPicture.asset("lib/images/pic1.svg"),
        ),
        SizedBox(height: 49.0.h),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Welcome to ",
              style: GoogleFonts.poppins(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: "Guide",
              style: GoogleFonts.poppins(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(32, 197, 122, 1),
              ),
            ),
          ]),
        ),
        SizedBox(height: 42.0.h),
        Text(
          "We are here to help answering all your concerns and solve all the problems you might face during studying in Esi-Sba .",
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 26.0.h),
      ],
    );
  }
}
