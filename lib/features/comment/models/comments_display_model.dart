class CommentModel {
  final int id;
  final int task;
  final int commenter;
  final String comment;
  final int? parentComment;
  final List<CommentModel> replies;
  final String timestamp;

  CommentModel({
    required this.id,
    required this.task,
    required this.commenter,
    required this.comment,
    this.parentComment,
    required this.replies,
    required this.timestamp,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      task: json['task'],
      commenter: json['commenter'],
      comment: json['comment'],
      parentComment: json['parent_comment'],
      replies: (json['replies'] as List)
          .map((reply) => CommentModel.fromJson(reply))
          .toList(),
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
      'commenter': commenter,
      'comment': comment,
      'parent_comment': parentComment,
      'replies': replies.map((reply) => reply.toJson()).toList(),
      'timestamp': timestamp,
    };
  }
}