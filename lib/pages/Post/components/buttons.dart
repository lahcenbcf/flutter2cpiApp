import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'likeButton/like_button_v.dart';
import 'likeButton/like_button_vm.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.iconSize,
    required this.likes,
    required this.comments,
  });
  final int likes;
  final int comments;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final likeButton = Provider.of<LikeButtonViewModel>(listen: false, context);
    likeButton.likes = likes;

    return Row(
      mainAxisSize: MainAxisSize.max,
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
            const LikeButton(),
            Consumer<LikeButtonViewModel>(builder: (context, state, child) {
              return Text(
                state.displayLikes(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.5.sp,
                ),
              );
            }),
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
              onTap: () {
                
              },
              child: Icon(
                Iconsax.message,
                color: Colors.white,
                size: 28 * iconSize,
              ),
            ),
            Text(
             comments==0? "comments": "$comments",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 10.5.sp,
              ),
            ),
          ],
        ),
        SizedBox(width: 50.w),
        //
        //
        //
        //
        // more button
        InkWell(
          onTap: () {
            
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
