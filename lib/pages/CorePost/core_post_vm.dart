import 'package:flluter2cpi/pages/CorePost/components/comment_class.dart';
import 'package:flutter/material.dart';


class CorePostViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();
  List<Comment> commentList=[];

  int commentsCount = 0;
  //
  //
  
  String display(String type) {
    int w = commentsCount;
    if (w <= 999) {
      return "$w";
    } else if (w > 999 && w < 1000000) {
      String x = (w / 1000).toString();
      return "${x[0]}${x[1]}${x[2]} K";
    } else if (w >= 1000000 && w < 1000000000) {
      String x = (w / 1000000).toString();
      return "${x[0]}${x[1]}${x[2]} M";
    }
    return "";
  }
  //
  //

  sendComment(){
    //use controller to send the comment
  }
}
