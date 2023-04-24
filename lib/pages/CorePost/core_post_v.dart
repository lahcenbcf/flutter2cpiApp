import 'package:flluter2cpi/pages/CorePost/components/pictures.dart';
import 'package:flluter2cpi/pages/CorePost/components/profile_icon.dart';
import 'package:flluter2cpi/pages/CorePost/core_post_vm.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import '../Post/components/likeButton/like_button_v.dart';
import '../Post/components/likeButton/like_button_vm.dart';
import 'components/DisplayComments/display_comment_v.dart';
import 'components/DisplayComments/display_comment_vm.dart';
import 'components/comment_class.dart';
import 'components/input.dart';

class PostCore extends StatelessWidget {
  const PostCore({
    super.key,
    required this.likesCount,
    required this.commentsCount,
    required this.title,
    required this.description,
    required this.date,
    required this.userName,
    required this.email,
    required this.tag,
    required this.comments,
    required this.generatedColor,
  });
  final String title;
  final String description;
  final String userName;
  final String email;
  final String tag;
  final int likesCount;
  final int commentsCount;
  final DateTime date;
  final List<Comment> comments;
  final int generatedColor;

  @override
  Widget build(BuildContext context) {
    final likeButton = Provider.of<LikeButtonViewModel>(context, listen: false);
    final displayComment =
        Provider.of<DisplayCommentsViewModel>(context, listen: false);

    //
    //
    final state = Provider.of<CorePostViewModel>(context, listen: false);
    state.commentsCount = commentsCount;
    state.commentList = comments;
    //
    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
    //

    var divider = Padding(
      padding: const EdgeInsets.symmetric(vertical: 6).h,
      child: const Divider(
        color: Color.fromRGBO(119, 119, 119, 1),
        thickness: 1,
      ),
    );
    //
    //
    //


    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 47, 56, 1),
        leading: Padding(
          padding: EdgeInsets.only(left: 19.w),
          child: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.of(context).pop();
              }
            },
            child: Icon(
              FluentIcons.arrow_left_48_filled,
              size: 30 * iconSize,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          tag,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                //for user name and profile icon and the more icon
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProfileIcon(
                          iconSize: iconSize,
                          generatedColor: generatedColor,
                          userName: userName,
                          email: email,
                        ),
                        SizedBox(width: 9.w),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25).h,
                          child: Text(
                            "@$userName",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25).h,
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
                SizedBox(height: 20.h),
                //
                //for the title
                //
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 45.h),
                //
                //for the description
                //
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                //
                //for the image
                //
                SizedBox(height: 40.h),
                const Pictures(),
                //
                SizedBox(height: 32.h),

                //for the date
                Text(
                  Jiffy.parseFromDateTime(date)
                      .format(pattern: "HH[:]mm[   ]dd[/]MM[/]yyyy"),
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(139, 152, 165, 1),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //

                divider,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer<LikeButtonViewModel>(
                        builder: (context, value, child) {
                      return Text(
                        likeButton.likes != 0 ? likeButton.displayLikes() : "",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      );
                    }),
                    Text(
                      " Likes",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(139, 152, 165, 1),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      state.display("comment"),
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      " Comments",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(139, 152, 165, 1),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                divider,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LikeButton(),
                    //
                    SizedBox(width: 70.w),
                    InkWell(
                      onTap: () {
                        state.unitCodeCtrlFocusNode.requestFocus();
                      },
                      child: Icon(
                        Iconsax.message,
                        color: Colors.white,
                        size: 28 * iconSize,
                      ),
                    ),
                  ],
                ),
                divider,
                //
                //
                //
                // the comments
                Container(
                  child: state.commentList.isEmpty
                      ? Center(
                          child: Text(
                            "No comment yet",
                            style: GoogleFonts.poppins(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ) // display all the comments of this post
                      : ListView.separated(
                          shrinkWrap: true,
                          primary: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Consumer<DisplayCommentsViewModel>(
                            builder: (context, value, child) => DisplayComment(
                              userName: state.commentList[index]
                                  .userName, ///////            ommentList[index].userName,
                              email: state.commentList[index].email,
                              comment: state.commentList[index].comment,
                              likesCount: state.commentList[index].likesCount,
                              commentsCount:
                                  state.commentList[index].commentsCount,
                              date: state.commentList[index].date,
                              number: (state.commentList.length * index) ~/ 18,
                            ),
                          ),
                          separatorBuilder: (context, index) => divider,
                          itemCount: state.commentList.length,
                        ),
                ),
                //
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Input(
        state: state,
        hint: "Comment ...",
      ),
    );
  }
}

// Column(
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     ProfileIcon(
//                       iconSize: iconSize,
//                       generatedColor: number,
//                       userName: userName,
//                       email: email,
//                     ),
//                     SizedBox(width: 7.w),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 27).h,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             userName,
//                             style: GoogleFonts.poppins(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800,
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                           SizedBox(width: 8.w),
//                           Text(
//                             Jiffy.parseFromDateTime(date).fromNow(),
//                             style: GoogleFonts.poppins(
//                               color: const Color.fromRGBO(119, 119, 119, 1),
//                               fontWeight: FontWeight.w700,
//                               fontSize: 12.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 27).h,
//                   child: InkWell(
//                     onTap: () {},
//                     child: Icon(
//                       FluentIcons.more_horizontal_32_filled,
//                       color: Colors.white,
//                       size: 28 * iconSize,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // for the comment text and verticle divider
//             IntrinsicHeight(
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   SizedBox(width: 14.w),
//                   const VerticalDivider(
//                     color: Color.fromRGBO(119, 119, 119, 1),
//                     thickness: 1,
//                     endIndent: 1,
//                     indent: 1,
//                   ),
//                   SizedBox(width: 25.w),
//                   Expanded(
//                     child: Text(
//                       comment,
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14.sp,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
