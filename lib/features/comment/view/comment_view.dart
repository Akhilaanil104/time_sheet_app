// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';

// // // import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';


// // // class CommentsView extends ConsumerStatefulWidget {
// // //   final int taskId;

// // //   const CommentsView({super.key, required this.taskId});

// // //   @override
// // //   ConsumerState<CommentsView> createState() => _CommentsViewState();
// // // }

// // // class _CommentsViewState extends ConsumerState<CommentsView> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final comments = ref.watch(displyCommentProvider);

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Comments"),
// // //       ),
// // //       body: comments.isEmpty
// // //           ? const Center(child: Text("No comments available"))
// // //           : ListView.builder(
// // //               padding: const EdgeInsets.all(8.0),
// // //               itemCount: comments.length,
// // //               itemBuilder: (context, index) {
// // //                 final comment = comments[index];
// // //                 return CommentTile(comment: comment);
// // //               },
// // //             ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           ref.read(displyCommentProvider.notifier).fetchComment(
// // //                 context: context,
// // //                 taskId: widget.taskId,
// // //               );
// // //         },
// // //         child: const Icon(Icons.refresh),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class CommentTile extends StatelessWidget {
// // //   final CommentDisplayModel comment;

// // //   const CommentTile({super.key, required this.comment});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Card(
// // //       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
// // //       child: Padding(
// // //         padding: const EdgeInsets.all(12.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               "${comment.senderName} → ${comment.receiverName}",
// // //               style: const TextStyle(fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 5),
// // //             Text(comment.comment),
// // //             const SizedBox(height: 5),
// // //             Text(
// // //               "Posted on: ${comment.createdAt.toLocal()}",
// // //               style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }




// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';
// // import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';

// // class CommentsView extends ConsumerStatefulWidget {
// //   final int taskId;

// //   const CommentsView({super.key, required this.taskId});

// //   @override
// //   ConsumerState<CommentsView> createState() => _CommentsViewState();
// // }

// // class _CommentsViewState extends ConsumerState<CommentsView> {
// //   int? replyingToIndex;
// //   final TextEditingController _commentController = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     Future.microtask(() => _fetchComments()); // Fetch comments on init
// //   }

// //   Future<void> _fetchComments() async {
// //     await ref.read(displyCommentProvider.notifier).fetchComment(context: context, taskId: widget.taskId);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final comments = ref.watch(displyCommentProvider);
// //     print("Current comments in UI: $comments"); // Debugging

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Comments"),
// //         backgroundColor: Colors.purple,
// //         elevation: 0,
// //       ),
// //       body: RefreshIndicator(
// //         onRefresh: _fetchComments, // Pull-to-refresh
// //         child: Column(
// //           children: [
// //             Expanded(
// //               child: comments.isEmpty
// //                   ? const Center(child: Text("No comments available"))
// //                   : ListView.builder(
// //                       physics: const AlwaysScrollableScrollPhysics(), // Allows pull-to-refresh even if the list is short
// //                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //                       itemCount: comments.length,
// //                       itemBuilder: (context, index) {
// //                         final comment = comments[index];
// //                         return Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             CommentTile(
// //                               comment: comment,
// //                               isAdmin: comment.senderName.toLowerCase() == "admin",
// //                               onReply: () {
// //                                 setState(() {
// //                                   replyingToIndex = index;
// //                                 });
// //                               },
// //                             ),
// //                             if (replyingToIndex == index) _buildReplyInput(),
// //                           ],
// //                         );
// //                       },
// //                     ),
// //             ),
// //             _buildCommentInput(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildReplyInput() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(12),
// //           border: Border.all(color: Colors.grey.shade300),
// //           color: Colors.white,
// //         ),
// //         padding: const EdgeInsets.all(10),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _commentController,
// //               decoration: const InputDecoration(
// //                 hintText: "Type your reply...",
// //                 border: InputBorder.none,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Align(
// //               alignment: Alignment.centerRight,
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     replyingToIndex = null;
// //                   });
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.purple,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
// //                 ),
// //                 child: const Text("Comment"),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCommentInput() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border(top: BorderSide(color: Colors.grey.shade300)),
// //       ),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(12),
// //                 border: Border.all(color: Colors.grey.shade300),
// //               ),
// //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //               child: TextField(
// //                 controller: _commentController,
// //                 decoration: const InputDecoration(
// //                   hintText: "Type something...",
// //                   border: InputBorder.none,
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 10),
// //           ElevatedButton(
// //             onPressed: () {
// //               _commentController.clear();
// //             },
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.purple,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// //             ),
// //             child: const Text("Comment"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CommentTile extends StatelessWidget {
// //   final CommentDisplayModel comment;
// //   final bool isAdmin;
// //   final VoidCallback? onReply;

// //   const CommentTile({super.key, required this.comment, this.isAdmin = false, this.onReply});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(12),
// //         color: Colors.white,
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.1),
// //             spreadRadius: 2,
// //             blurRadius: 3,
// //             offset: const Offset(0, 1),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               CircleAvatar(
// //                 backgroundColor: Colors.grey.shade300,
// //                 radius: 20,
// //                 child: const Icon(Icons.person, color: Colors.white),
// //               ),
// //               const SizedBox(width: 12),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     comment.senderName,
// //                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
// //                   ),
// //                   Text(
// //                     "${comment.createdAt.toLocal()}",
// //                     style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 6),
// //           Text(
// //             comment.comment,
// //             style: const TextStyle(fontSize: 14),
// //           ),
// //           if (isAdmin)
// //             Align(
// //               alignment: Alignment.centerRight,
// //               child: TextButton(
// //                 onPressed: onReply,
// //                 child: const Text("Reply", style: TextStyle(color: Colors.blue, fontSize: 14)),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }






// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';
// import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';

// class CommentsView extends ConsumerStatefulWidget {
//   final int taskId;

//   const CommentsView({super.key, required this.taskId});

//   @override
//   ConsumerState<CommentsView> createState() => _CommentsViewState();
// }

// class _CommentsViewState extends ConsumerState<CommentsView> {
//   int? replyingToIndex;
//   final TextEditingController _commentController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() => _fetchComments());
//   }

//   Future<void> _fetchComments() async {
//     await ref.read(displyCommentProvider.notifier).fetchComment(context: context, taskId: widget.taskId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final comments = ref.watch(displyCommentProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Comments"),
//         backgroundColor: Colors.purple,
//         elevation: 0,
//       ),
//       body: RefreshIndicator(
//         onRefresh: _fetchComments, // Pull to refresh
//         child: Column(
//           children: [
//             Expanded(
//               child: comments.isEmpty
//                   ? const Center(child: Text("No comments available"))
//                   : ListView.builder(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                       itemCount: comments.length,
//                       itemBuilder: (context, index) {
//                         final comment = comments[index];
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CommentTile(
//                               comment: comment,
//                               isAdmin: comment.senderName.toLowerCase() == "admin",
//                               onReply: () {
//                                 setState(() {
//                                   replyingToIndex = index;
//                                 });
//                               },
//                             ),
//                             if (replyingToIndex == index) _buildReplyInput(),
//                           ],
//                         );
//                       },
//                     ),
//             ),
//             _buildCommentInput(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildReplyInput() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.grey.shade300),
//           color: Colors.white,
//         ),
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             TextField(
//               controller: _commentController,
//               decoration: const InputDecoration(
//                 hintText: "Type your reply...",
//                 border: InputBorder.none,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     replyingToIndex = null;
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                 ),
//                 child: const Text("Comment"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCommentInput() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: TextField(
//                 controller: _commentController,
//                 decoration: const InputDecoration(
//                   hintText: "Type something...",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           ElevatedButton(
//             onPressed: () {
//               _commentController.clear();
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.purple,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             ),
//             child: const Text("Comment"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CommentTile extends StatelessWidget {
//   final CommentDisplayModel comment;
//   final bool isAdmin;
//   final VoidCallback? onReply;

//   const CommentTile({super.key, required this.comment, this.isAdmin = false, this.onReply});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 3,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.grey.shade300,
//                 radius: 20,
//                 child: const Icon(Icons.person, color: Colors.white),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     comment.senderName,
//                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   ),
//                   Text(
//                     "${comment.createdAt.toLocal()}",
//                     style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               if (isAdmin)
//                 TextButton(
//                   onPressed: onReply,
//                   child: const Text("Reply", style: TextStyle(color: Colors.blue, fontSize: 14)),
//                 ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Text(
//             comment.comment,
//             style: const TextStyle(fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/comment/model/comment_creation_model.dart';
import 'package:time_sheet_app/features/comment/provider/comment_creation_provider.dart';
import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';
import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';

class CommentsView extends ConsumerStatefulWidget {
  final int taskId;


  const CommentsView({super.key, required this.taskId});

  @override
  ConsumerState<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends ConsumerState<CommentsView> {
  int? replyingToIndex;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchComments());
  }

  Future<void> _fetchComments() async {
    await ref
        .read(displyCommentProvider.notifier)
        .fetchComment(context: context, taskId: widget.taskId);
  }

  Future<void> _postComment({String? replyToCommentId}) async {
     final sharedPrefServices = ref.read(sharedPrefServicesProvider);
 final sender =sharedPrefServices.getUserId();
    final commentText = _commentController.text.trim();
    if (commentText.isEmpty) return;

    final commentData = CommentCreationModel(
      taskAssignmentId:  widget.taskId,
       senderId:3 , receiverId: 19, comment: commentText,);
  

    await ref.read(commentCreationProvider.notifier).getComment(
          context: context,
          commentData: commentData,
        );

    _commentController.clear();
    setState(() {
      replyingToIndex = null;
    });

    // Refresh comments after posting
    await _fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    final comments = ref.watch(displyCommentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _fetchComments, // Pull to refresh
        child: Column(
          children: [
            Expanded(
              child: comments.isEmpty
                  ? const Center(child: Text("No comments available"))
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommentTile(
                              comment: comment,
                              isAdmin:
                                  comment.senderName.toLowerCase() == "admin",
                              onReply: () {
                                setState(() {
                                  replyingToIndex = index;
                                });
                              },
                            ),
                            if (replyingToIndex == index)
                              _buildReplyInput(comment.id as String),
                          ],
                        );
                      },
                    ),
            ),
            _buildCommentInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyInput(String replyToCommentId) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: "Type your reply...",
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () =>
                    _postComment(replyToCommentId: replyToCommentId),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                ),
                child: const Text("Reply"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: "Type something...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () => _postComment(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text("Comment"),
          ),
        ],
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final CommentDisplayModel comment;
  final bool isAdmin;
  final VoidCallback? onReply;

  const CommentTile(
      {super.key, required this.comment, this.isAdmin = false, this.onReply});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20,
                child: const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.senderName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "${comment.createdAt.toLocal()}",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              if (isAdmin)
                TextButton(
                  onPressed: onReply,
                  child: const Text("Reply",
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            comment.comment,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
