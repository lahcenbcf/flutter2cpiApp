import 'package:flluter2cpi/pages/Post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


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
          onTap: () => state.onTap(),
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
