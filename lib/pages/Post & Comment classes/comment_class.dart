import 'dart:io';


class CommentClass {
  CommentClass({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.date,
    this.isLiked = false,
    required this.profilePic,
    this.isReported = false,
    required this.links,
  });
  final File? profilePic;
  final String userName;
  final String email;
  final String comment;
  int likesCount;
  final int commentsCount;
  final DateTime date;
  bool isLiked;
  bool isReported;
  final List<String> links;
}
