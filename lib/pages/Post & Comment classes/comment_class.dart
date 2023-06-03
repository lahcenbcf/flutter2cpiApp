import 'dart:io';
import 'dart:typed_data';


class CommentClass {
  CommentClass({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.date,
    this.isLiked = false,
    required this.commentId,
     required this.profilePic,
    this.isReported = false,
    required this.links,
  });
  final String profilePic;
  final String userName;
  final String email;
  final String comment;
  String commentId;
  int likesCount;
  final int commentsCount;
  final String date;
  bool isLiked;
  bool isReported;
  final List<dynamic> links;
}
