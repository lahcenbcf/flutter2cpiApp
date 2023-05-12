import 'dart:io';

import 'package:flluter2cpi/pages/CorePost/components/comment_like_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Post & Comment classes/posts_tags.dart';
import '../../Post/post_v.dart';

class DisplayComment extends StatefulWidget {
  DisplayComment({
    super.key,
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.date,
    required this.controllerTag,
    required this.index,
    required this.profilePic,
    required this.isReported,
    required this.links,
  });
  final String userName;
  final String email;
  final String comment;
  final int likesCount;
  final int commentsCount;
  final DateTime date;
  final String controllerTag;
  final int index;
  final File? profilePic;
  bool isReported;
  final List<String> links;

  @override
  State<DisplayComment> createState() => _DisplayCommentState();
}

class _DisplayCommentState extends State<DisplayComment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);

    return Column(
      children: [
        //for the profile name and icon and date and 3 verticle dots point
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // profile picture

                GestureDetector(
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
                    radius: 23 * iconSize,
                    backgroundColor: widget.profilePic == null
                        ? const Color.fromRGBO(67, 69, 75, 1)
                        : null,
                    backgroundImage: widget.profilePic != null
                        ? FileImage(
                            File(widget.profilePic!.path),
                          )
                        : null,
                    child: widget.profilePic == null
                        ? Text(
                            widget.userName[0].toUpperCase() +
                                widget.email[0].toUpperCase(),
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
                          "@${widget.userName}",
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
                          widget.email,
                          style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0.w),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(text: widget.email))
                                .then(
                              (_) => Toast.show(
                                "${widget.email} copied to clipboard",
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
                    if (widget.links.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15).w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget.links[0].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(widget.links[0]);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${widget.links[0]}';
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
                            if (widget.links[1].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(widget.links[1]);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${widget.links[1]}';
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
                            if (widget.links[2].isNotEmpty)
                              InkWell(
                                onTap: () async {
                                  Uri uri = Uri.parse(widget.links[2]);
                                  print("ff");
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch ${widget.links[2]}';
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
                    backgroundColor: widget.profilePic == null
                        ? const Color.fromRGBO(67, 69, 75, 1)
                        : null,
                    backgroundImage: widget.profilePic != null
                        ? FileImage(
                            File(widget.profilePic!.path),
                          )
                        : null,
                    child: widget.profilePic == null
                        ? Text(
                            widget.userName[0].toUpperCase() +
                                widget.email[0].toUpperCase(),
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              fontSize: 18.sp,
                            ),
                          )
                        : null,
                  ),
                ),

                SizedBox(width: 7.w),
                Padding(
                  padding: const EdgeInsets.only(bottom: 27).h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.userName,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        Jiffy.parseFromDateTime(widget.date).fromNow(),
                        style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(119, 119, 119, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 27).h,
              child: GestureDetector(
                onTapDown: (details) {
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                      details.globalPosition.dx,
                      details.globalPosition.dy,
                    ),
                    color: const Color.fromRGBO(157, 170, 181, 1),
                    items: [
                      PopupMenuItem(
                        height: 0,
                        onTap: () {
                          widget.isReported = true;
                          bool found = false;
                          int i = 0;

                          while (!found && i < 3) {
                            List<Post> list = [];
                            switch (i) {
                              case 0:
                                list = ePosts;
                                break;
                              case 1:
                                list = aPosts;
                                break;
                              default:
                                list = infoPosts;
                            }
                            int j = 0;
                            while (!found && j < list.length) {
                              if (list[j].controllerTag ==
                                  widget.controllerTag) {
                                switch (i) {
                                  case 0:
                                    ePosts[j].comments.removeAt(widget.index);
                                    ePosts[j].commentsCount--;
                                    break;
                                  case 1:
                                    aPosts[j].comments.removeAt(widget.index);
                                    aPosts[j].commentsCount--;

                                    break;
                                  default:
                                    infoPosts[j]
                                        .comments
                                        .removeAt(widget.index);
                                    infoPosts[j].commentsCount--;
                                }
                                found = true;
                                Get.forceAppUpdate();
                              } else {
                                j++;
                              }
                            }
                            i++;
                          }
                        },
                        child: Text(
                          "Report this comment",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                child: Icon(
                  Iconsax.more,
                  color: Colors.white,
                  size: 28 * iconSize,
                ),
              ),
            ),
          ],
        ),
        // for the comment text and verticle divider
        IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 14.w),
              const VerticalDivider(
                color: Color.fromRGBO(119, 119, 119, 1),
                thickness: 1,
                endIndent: 1,
                indent: 1,
              ),
              SizedBox(width: 25.w),
              Expanded(
                child: Text(
                  widget.comment,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        // for the like and comment button
        SizedBox(height: 10.h),
        CommentLikeButton(
          controllerTag: widget.controllerTag,
          index: widget.index,
        ),
      ],
    );
  }
}

//  Container(
//       //color: Colors.red,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           // profile pic and verticle divider
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               ProfileIcon(
//                   iconSize: iconSize,
//                   generatedColor: generatedColor,
//                   userName: userName,
//                   email: email),
//               const VerticalDivider(
//                 color: Colors.white,
//                 width: 1,
//                 indent: 1,
//                 endIndent: 1,
//               ),
//             ],
//           ),
//           Expanded(
//             child: Container(
//               color: Colors.pink,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // profile name and comment and other things
                      
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         color: Colors.green,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(
//                               userName,
//                               style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             SizedBox(width: 8.w),
//                             Text(
//                               Jiffy.parseFromDateTime(date).fromNow(),
//                               style: GoogleFonts.poppins(
//                                 color: const Color.fromRGBO(119, 119, 119, 1),
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 12.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Icon(
//                           FluentIcons.more_horizontal_32_filled,
//                           color: Colors.white,
//                           size: 28 * iconSize,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 34.h),
//                   Text(
//                     comment,
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
