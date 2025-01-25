// class CommentModel {
//   final String comment;
//   final String? parentComment;

//   CommentModel({
//     required this.comment,
//    required this.parentComment,
//   });

//   // Factory method to create an instance from JSON
//   factory CommentModel.fromJson(Map<String, dynamic> json) {
//     return CommentModel(
//       comment: json['comment'],
//       parentComment: json['parent_comment'],
//     );
//   }

//   // Method to convert an instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'comment': comment,
//       'parent_comment': parentComment,
//     };
//   }
// }