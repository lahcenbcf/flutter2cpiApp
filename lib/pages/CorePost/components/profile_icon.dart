import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.iconSize,
    required this.generatedColor,
    required this.userName,
    required this.email,
  });

  final double iconSize;
  final int generatedColor;
  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23 * iconSize,
      backgroundColor: Colors.primaries[generatedColor],
      child: Text(
        userName[0].toUpperCase() + email[0].toUpperCase(),
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
