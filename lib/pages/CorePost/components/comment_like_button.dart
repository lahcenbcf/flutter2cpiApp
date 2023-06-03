import 'package:flluter2cpi/pages/CorePost/core_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class CommentLikeButton extends StatefulWidget {
  const CommentLikeButton({
    super.key,
    required this.controllerTag,
    required this.index,
    required this.commentOid,
    required this.isLiked
  });
  final String controllerTag;
  final int index;
  final String commentOid;
  final bool isLiked;
  @override
  State<CommentLikeButton> createState() => _CommentLikeButtonState();
}

class _CommentLikeButtonState extends State<CommentLikeButton> {
  @override
  Widget build(BuildContext context) {
    //
    //
    //
    //
    //
    final size = MediaQuery.of(context).size;
    /*final CorePostCotroller state =
        Get.find<CorePostCotroller>(tag: widget.controllerTag);*/
    final iconSize = (((size.height / 844) + (size.width / 390)) / 2);
    //
    //
    //
    //

    return GetBuilder<CorePostCotroller>(
     
      tag: widget.controllerTag,
      builder: (state) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 54.w),
          AnimatedSize(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: GestureDetector(
              onTap: () => state.onTap(widget.index,widget.commentOid),
              child: Icon(
                widget.isLiked ? Iconsax.heart5 : Iconsax.heart4,
                size: 20 * iconSize,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            state.displayLikes(widget.index),
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}