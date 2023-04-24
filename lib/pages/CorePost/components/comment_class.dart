class Comment {
  Comment({
    required this.userName,
    required this.email,
    required this.comment,
    required this.likesCount,
    required this.commentsCount,
    required this.date,
  });
  final String userName;
  final String email;
  final String comment;
  final int likesCount;
  final int commentsCount;
  final DateTime date;
}
