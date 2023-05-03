
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
    required this.userName,
    required this.email,
  });

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);

    return CircleAvatar(
      radius: 23 * iconSize,
      backgroundColor: const Color.fromRGBO (67, 69, 75,1),
      child: Text(
        userName[0].toUpperCase() + email[0].toUpperCase(),
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
