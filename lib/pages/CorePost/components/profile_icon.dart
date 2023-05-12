import 'dart:io';

import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon(
      {super.key,
      required this.userName,
      required this.email,
      required this.controllerTag,
      required this.links});

  final String userName;
  final String email;
  final String controllerTag;
  final List<String> links;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final PostController state = Get.find<PostController>(tag: controllerTag);
    return GestureDetector(
      onTapDown: (details) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: const Color.fromRGBO(35, 47, 56, 1),
                  border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 1), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30 * iconSize,
                          backgroundColor: state.profilePic == null
                              ? const Color.fromRGBO(67, 69, 75, 1)
                              : null,
                          backgroundImage: state.profilePic != null
                              ? FileImage(File(state.profilePic!.path))
                              : null,
                          child: state.profilePic == null
                              ? Text(
                                  userName[0].toUpperCase() +
                                      email[0].toUpperCase(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18.sp,
                                  ),
                                )
                              : null,
                        ),
                        SizedBox(width: 10.0.w),
                        Text(
                          "@$userName",
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 62.0.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Text(
                                "Exit",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(32, 197, 122, 1),
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.4.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "E-mail:",
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 15.0.h),
                        Text(
                          email,
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0.w),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: email))
                                .then(
                              (_) => Toast.show(
                                "$email copied to clipboard",
                                duration: Toast.lengthShort,
                                gravity: Toast.center,
                                textStyle: GoogleFonts.poppins(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(157, 170, 181, 1),
                              ),
                            );
                            // copied successfully
                          },
                          child: Icon(
                            FluentIcons.copy_24_filled,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            size: iconSize * 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0.h),
                    if (links.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15).w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (links[0].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(links[0]);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${links[0]}';
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 36.h,
                                      width: 36.h,
                                      child: Image.asset(
                                        "lib/images/linkedin.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "Linkedin",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            // SizedBox(width: 48.0.w),
                            if (links[1].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(links[1]);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${links[1]}';
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 36.h,
                                      width: 36.h,
                                      child: Image.asset(
                                        "lib/images/github.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "GitHub",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            //  SizedBox(width: 48.0.w),
                            if (links[2].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(links[2]);
                                  print("ff");
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${links[2]}';
                                  }
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 36.h,
                                      width: 36.h,
                                      child: Image.asset(
                                        "lib/images/telegram.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "Telegram",
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 11.0.sp,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 23 * iconSize,
        backgroundColor: state.profilePic == null
            ? const Color.fromRGBO(67, 69, 75, 1)
            : null,
        backgroundImage: state.profilePic != null
            ? FileImage(File(state.profilePic!.path))
            : null,
        child: state.profilePic == null
            ? Text(
                userName[0].toUpperCase() + email[0].toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.sp,
                ),
              )
            : null,
      ),
    );
  }
}
