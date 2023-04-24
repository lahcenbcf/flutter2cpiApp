import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleDescription extends StatelessWidget {
  const TitleDescription({
    super.key,
    required this.text,
    required this.size,
  });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            
            text: (size == 16) || (text.length <= 34)
                ? text
                : text.length > 34 && text.length <= 78
                    ? text.substring(0, 35)
                    : text.length > 78 && text.length <= 122
                        ? text.substring(0, 79)
                        : text.length > 122 && text.length <= 164
                            ? text.substring(0, 123)
                            : text.substring(0, 165),
            style: GoogleFonts.poppins(
              fontSize: size.sp,
              fontWeight: size == 16 ? FontWeight.w700 : FontWeight.w500,
              color: Colors.white,
            ),
          ),
          if (size != 16)
            TextSpan(
              text: "    ...Show",
              style: GoogleFonts.poppins(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(255, 255, 255, 0.38),
              ),
            )
        ],
      ),
    );
    //  Text(
    //     text,

    //    maxLines:size == 16?2:4 ,
    //    overflow: TextOverflow.ellipsis,
    //     style: GoogleFonts.poppins(
    //       // height: 1.5.h,
    //       fontSize: size.sp,
    //       fontWeight:size == 16 ? FontWeight.w700 : FontWeight.w500,
    //       color: Colors.white,
    //     ),
    //   );
  }
}
