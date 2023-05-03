class CommentClass {
  CommentClass({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.date,
     this.isLiked = false,
  });
  final String userName;
  final String email;
  final String comment;
    int likesCount;
  final int commentsCount;
  final DateTime date;
   bool isLiked;
}
