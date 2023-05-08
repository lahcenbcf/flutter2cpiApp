import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({
    super.key,
    required this.controllerTag,
  });
  final String controllerTag;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
     ToastContext().init(context);
    //
    //
    //
    //
    //
    final size = MediaQuery.of(context).size;

    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
    //
    //

    return AnimatedSize(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
      child: GetBuilder<PostController>(
        tag: widget.controllerTag,
        builder: (state) => GestureDetector(
          onTap: () async {
            final pref = await SharedPreferences.getInstance();
            bool isGuest = true;// pref.getBool("isGuest") ?? false;
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
              state.onTap();
            }
          },
          child: Icon(
            state.isLiked ? Iconsax.heart5 : Iconsax.heart4,
            size: 28 * iconSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
