class CommentClass {
  CommentClass({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.formattedDate,
    required this.isLiked,
    this.commentId
  });
  final String userName;
  final String email;
  final String comment;
  final String ?commentId;
  int likesCount;
  final int commentsCount;
  final String formattedDate;
  bool isLiked;
}
