import 'dart:io';

import 'package:flluter2cpi/pages/CorePost/components/comment_like_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';


class DisplayComment extends StatefulWidget {
  const DisplayComment({
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
                widget.profilePic == null
                    ? CircleAvatar(
                        radius: 23 * iconSize,
                        backgroundColor: const Color.fromRGBO(67, 69, 75, 1),
                        child: Text(
                          widget.userName[0].toUpperCase() +
                              widget.email[0].toUpperCase(),
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
                            File(widget.profilePic!.path),
                            fit: BoxFit.cover,
                          ),
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
              child: InkWell(
                onTap: () {},
                child: Icon(
                  FluentIcons.more_horizontal_32_filled,
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
