import 'package:flluter2cpi/pages/Post%20&%20Comment%20classes/posts_tags.dart';
import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../post_v.dart';
import 'like_button_v.dart';

class Buttons extends StatelessWidget {
  Buttons({
    super.key,
    required this.navigatToPostCore,
    required this.controllerTag,
    required this.isBlack,
    required this.isReported,
  });
  final void Function() navigatToPostCore;
  final bool isBlack;
  final String controllerTag;
  bool isReported;

  // final LikeButtonController likeButtonState;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    final PostController x =
        Get.put<PostController>(PostController(), tag: controllerTag);
    print("BUILD");
    return Row(
      mainAxisSize: isBlack ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        //
        //
        //
        // like button
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LikeButton(controllerTag: controllerTag),
            StatefulBuilder(
              builder: (context, setState) => GetBuilder<PostController>(
                tag: controllerTag,
                builder: (state) {
                  print("BUILD likes    ${state.controllerTag} $controllerTag");

                  return Text(
                    state.displayLikes(),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.5.sp,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(width: 50.w),
        //
        //
        //
        // comment button
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    backgroundColor: const Color.fromRGBO(157, 170, 181, 1),
                  );
                } else {
                  navigatToPostCore();
                }
              },
              child: Icon(
                Iconsax.message,
                color: Colors.white,
                size: 28 * iconSize,
              ),
            ),
            GetBuilder<PostController>(
              tag: controllerTag,
              builder: (x) {
                return Text(
                  x.displayComments(),
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.5.sp,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(width: 50.w),
        //

        //
        // more button
        if (isBlack)
          GestureDetector(
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
                      isReported = true;
                      bool found = false;
                      int i = 0;
                      print(aPosts.length);

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
                          if (list[j].controllerTag == controllerTag) {
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
                      print(aPosts.length);
                    },
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
              Iconsax.more,
              color: Colors.white,
              size: 28 * iconSize,
            ),
          ),
      ],
    );
  }
}
