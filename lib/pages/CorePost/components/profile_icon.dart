import 'dart:io';

import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon(
      {super.key,
      required this.userName,
      required this.email,
      required this.controllerTag});

  final String userName;
  final String email;
  final String controllerTag;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final PostController state = Get.find<PostController>(tag: controllerTag);
    return state.profilePic == null
        ? CircleAvatar(
            radius: 23 * iconSize,
            backgroundColor: const Color.fromRGBO(67, 69, 75, 1),
            child: Text(
              userName[0].toUpperCase() + email[0].toUpperCase(),
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 18.sp,
              ),
            ),
          )
        : ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(23 * iconSize),
              child: Image.file(
                File(state.profilePic!.path),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
