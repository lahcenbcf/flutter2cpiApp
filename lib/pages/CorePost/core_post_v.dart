import 'package:flluter2cpi/pages/CorePost/components/Image/display_image.dart';
import 'package:flluter2cpi/pages/CorePost/components/input.dart';
import 'package:flluter2cpi/pages/CorePost/components/Image/imagee.dart';
import 'package:flluter2cpi/pages/CorePost/components/profile_icon.dart';
import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import '../Post & Comment classes/posts_tags.dart';
import '../Post/components/like_button_v.dart';
import '../Post/post_v.dart';
import 'components/display_comment_v.dart';
import '../Post & Comment classes/comment_class.dart';

class PostCore extends StatefulWidget {
  PostCore({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.userName,
    required this.email,
    required this.tag,
    required this.comments,
    required this.generatedColor,
    //required this.likeButtonState,
    required this.controllerTag,
    required this.isReported,
    required this.links,
  });
  final List<String> links;
  final String title;
  final String description;
  final String userName;
  final String email;
  final String tag;
  final DateTime date;
  final List<CommentClass> comments;
  final int generatedColor;
  // final LikeButtonController likeButtonState;
  final String controllerTag;
  bool isReported;

  @override
  State<PostCore> createState() => _PostCoreState();
}

class _PostCoreState extends State<PostCore> {
  @override
  Widget build(BuildContext context) {
    // final likeButton = Provider.of<LikeButtonViewModel>(context, listen: false);

    //

    //
    final CorePostCotroller state = Get.find(tag: widget.controllerTag);

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
          widget.tag,
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
                          userName: widget.userName,
                          email: widget.email,
                          controllerTag: widget.controllerTag,
                          links: widget.links,
                        ),
                        SizedBox(width: 9.w),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25).h,
                          child: Text(
                            "@${widget.userName}",
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
                      child: GestureDetector(
                        onTapDown: (details) {
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
                                    ePosts.removeAt(j);

                                    break;
                                  case 1:
                                    aPosts.removeAt(j);

                                    break;
                                  default:
                                    infoPosts.removeAt(j);
                                }
                                found = true;
                                Get.forceAppUpdate();
                              } else {
                                j++;
                              }
                            }
                            i++;
                          }
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
                                onTap: () => widget.isReported = true,
                                child: Text(
                                  "Report this post",
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
                  widget.title,
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
                  widget.description,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                //
                //for the image
                //
                if (state.image != null) SizedBox(height: 40.h),
                if (state.image != null)
                  InkWell(
                      onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayImage(
                                controllerTag: widget.controllerTag,
                              ),
                            ),
                          ),
                      child: Imagee(controllerTag: widget.controllerTag)),
                //
                SizedBox(height: 32.h),

                //for the date
                Text(
                  Jiffy.parseFromDateTime(widget.date)
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
                    GetBuilder<PostController>(
                      tag: widget.controllerTag,
                      builder: (value) => Text(
                        value.likesCount != 0 ? value.displayLikes() : "",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      " Likes",
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(139, 152, 165, 1),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GetBuilder<PostController>(
                      tag: widget.controllerTag,
                      builder: (state) => Text(
                        state.commentsCount != 0 ? state.displayComments() : "",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
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
                    LikeButton(controllerTag: widget.controllerTag),
                    //
                    SizedBox(width: 70.w),
                    InkWell(
                      onTap: () async {
                        final pref = await SharedPreferences.getInstance();
                        bool isGuest = pref.getBool("isGuest") ?? false;
                        if (isGuest) {
                          Toast.show(
                            "you are not logged in",
                            duration: Toast.lengthLong,
                            gravity: Toast.center,
                            textStyle: GoogleFonts.poppins(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            backgroundColor:
                                const Color.fromRGBO(157, 170, 181, 1),
                          );
                        } else {
                          state.unitCodeCtrlFocusNode.requestFocus();
                        }
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
                  child: state.comments.isEmpty
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
                      : GetBuilder<CorePostCotroller>(
                          tag: widget.controllerTag,
                          builder: (value) => ListView.separated(
                            shrinkWrap: true,
                            primary: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => DisplayComment(
                              links: value.comments[index].links,
                              isReported: value.comments[index].isReported,
                              profilePic: value.comments[index].profilePic,
                              userName: value.comments[index].userName,
                              email: value.comments[index].email,
                              comment: value.comments[index].comment,
                              likesCount: value.comments[index].likesCount,
                              commentsCount:
                                  value.comments[index].commentsCount,
                              date: value.comments[index].date,
                              controllerTag: widget.controllerTag,
                              index: index,
                            ),
                            separatorBuilder: (context, index) => divider,
                            itemCount: value.comments.length,
                          ),
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
        hint: "Comment ...",
        controllerTag: widget.controllerTag,
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
