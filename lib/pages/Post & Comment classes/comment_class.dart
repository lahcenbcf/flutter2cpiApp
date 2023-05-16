import 'dart:io';
import 'dart:typed_data';


class CommentClass {
  CommentClass({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.formattedDate,
    this.isLiked = false,
    required this.commentId,
    required this.profilePic,
    //required this.pathProfile,
    this.isReported = false,
    required this.links,
  });
  final Uint8List?profilePic;
  final String userName;
  final String email;
  final String comment;
  //final String pathProfile;
  final String ?commentId;
  int likesCount;
  final int commentsCount;
  final String formattedDate;
  bool isLiked;
  bool isReported;
  final List<String> links;
}
