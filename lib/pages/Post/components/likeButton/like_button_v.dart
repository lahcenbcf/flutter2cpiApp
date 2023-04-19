import 'package:flluter2cpi/pages/Post/components/likeButton/like_button_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

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
    return Consumer<LikeButtonViewModel>(
      builder: (context, state, child) => AnimatedSize(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: GestureDetector(
        
          onTap: () => state.onTap(),
          
          child: Icon(
            state.icon,
            size: 28  * iconSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
