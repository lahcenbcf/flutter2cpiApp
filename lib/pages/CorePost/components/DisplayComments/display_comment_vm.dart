import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class DisplayCommentsViewModel extends ChangeNotifier{
bool isLiked = false;
IconData icon = Iconsax.heart4;
int likes = 0;
  // when tap in a comment
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
}