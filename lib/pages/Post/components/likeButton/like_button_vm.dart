import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LikeButtonViewModel extends ChangeNotifier {
  bool isLiked = false;
  IconData? icon = Iconsax.heart4;
  int likes = 0;

  onTap() {
    if (isLiked) {
      icon = Iconsax.heart4;
      likes--;
      // lahcen call your function that decrement number of likes
    } else {
      icon = Iconsax.heart5;
      likes++;
      // lahcen call here your function that increment number of likes
    }
    isLiked = !isLiked;
    notifyListeners();
  }

  String displayLikes() {
    if (likes == 0) {
      return "like";
    }else
    if (likes > 999 && likes < 1000000) {
      String x = (likes / 1000).toString();
      return "${x[0]}${x[1]}${x[2]} K";
    } else if (likes >= 1000000 && likes < 1000000000) {
      String x = (likes / 1000000).toString();
      return "${x[0]}${x[1]}${x[2]} M";
    }
    return "$likes";
  }
}
