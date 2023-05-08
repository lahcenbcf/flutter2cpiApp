import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'like_button_v.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.navigatToPostCore,
    required this.controllerTag,
    required this.isBlack,
  });
  final void Function() navigatToPostCore;
  final bool isBlack;
  final String controllerTag;
  // final LikeButtonController likeButtonState;

  @override
  Widget build(BuildContext context) {
     ToastContext().init(context);

    final size = MediaQuery.of(context).size;
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
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
            GetBuilder<PostController>(
              tag: controllerTag,
              builder: (state) {
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
              builder: (state) => Text(
                state.displayComments(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.5.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 50.w),
        //

        //
        // more button
        if (isBlack)
          InkWell(
            onTap: () {},
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
