class CommentCreationModel {
  final int taskAssignmentId;
  final int senderId;
  final int receiverId;
  final String comment;
  final int? parentCommentId;

  CommentCreationModel({
    required this.taskAssignmentId,
    required this.senderId,
    required this.receiverId,
    required this.comment,
    this.parentCommentId,
  });

  factory CommentCreationModel.fromJson(Map<String, dynamic> json) {
    return CommentCreationModel(
      taskAssignmentId: json['task_assignment_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      comment: json['comment'],
      parentCommentId: json['parent_comment_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_assignment_id': taskAssignmentId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'comment': comment,
      'parent_comment_id': parentCommentId,
    };
  }
}
