import 'dart:convert';

class CommentDisplayModel {
  final int id;
  final int taskAssignment;
  final int sender;
  final int receiver;
  final String senderName;
  final String receiverName;
  final String comment;
  final int? parentComment;
  final DateTime createdAt;

  CommentDisplayModel({
    required this.id,
    required this.taskAssignment,
    required this.sender,
    required this.receiver,
    required this.senderName,
    required this.receiverName,
    required this.comment,
    this.parentComment,
    required this.createdAt,
  });

  factory CommentDisplayModel.fromJson(Map<String, dynamic> json) {
    return CommentDisplayModel(
      id: json['id'],
      taskAssignment: json['task_assignment'],
      sender: json['sender'],
      receiver: json['receiver'],
      senderName: json['sender_name'],
      receiverName: json['receiver_name'],
      comment: json['comment'],
      parentComment: json['parent_comment'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task_assignment': taskAssignment,
      'sender': sender,
      'receiver': receiver,
      'sender_name': senderName,
      'receiver_name': receiverName,
      'comment': comment,
      'parent_comment': parentComment,
      'created_at': createdAt.toIso8601String(),
    };
  }

  static List<CommentDisplayModel> fromJsonList(String jsonString) {
    Iterable decoded = jsonDecode(jsonString);
    return decoded.map((json) => CommentDisplayModel.fromJson(json)).toList();
  }
}