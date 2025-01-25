// // // // // import 'package:flutter/material.dart';

// // // // // class AddCommentsPage extends StatefulWidget {
// // // // //   final String taskTitle;

// // // // //   const AddCommentsPage({Key? key, required this.taskTitle}) : super(key: key);

// // // // //   @override
// // // // //   _AddCommentsPageState createState() => _AddCommentsPageState();
// // // // // }

// // // // // class _AddCommentsPageState extends State<AddCommentsPage> {
// // // // //   final TextEditingController _commentController = TextEditingController();
// // // // //   final List<String> _comments = [];

// // // // //   void _addComment() {
// // // // //     if (_commentController.text.isNotEmpty) {
// // // // //       setState(() {
// // // // //         _comments.add(_commentController.text);
// // // // //         _commentController.clear();
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Colors.purple,
// // // // //         title: Text("Comments for ${widget.taskTitle}"),
// // // // //       ),
// // // // //       body: Column(
// // // // //         children: [
// // // // //           // Comments List
// // // // //           Expanded(
// // // // //             child: _comments.isEmpty
// // // // //                 ? Center(
// // // // //                     child: Text(
// // // // //                       "No comments yet. Be the first to add one!",
// // // // //                       style: TextStyle(color: Colors.grey, fontSize: 16),
// // // // //                     ),
// // // // //                   )
// // // // //                 : ListView.builder(
// // // // //                     itemCount: _comments.length,
// // // // //                     itemBuilder: (context, index) {
// // // // //                       return ListTile(
// // // // //                         leading: Icon(Icons.comment, color: Colors.purple),
// // // // //                         title: Text(_comments[index]),
// // // // //                       );
// // // // //                     },
// // // // //                   ),
// // // // //           ),

// // // // //           // Input Field at the Bottom
// // // // //           Container(
// // // // //             padding: const EdgeInsets.all(8.0),
// // // // //             color: Colors.white,
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 // Text Field
// // // // //                 Expanded(
// // // // //                   child: TextField(
// // // // //                     controller: _commentController,
// // // // //                     decoration: InputDecoration(
// // // // //                       hintText: "Add a comment",
// // // // //                       border: OutlineInputBorder(
// // // // //                         borderRadius: BorderRadius.circular(8),
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 8),
// // // // //                 // Add Button
// // // // //                 ElevatedButton(
// // // // //                   onPressed: _addComment,
// // // // //                   style: ElevatedButton.styleFrom(
// // // // //                     backgroundColor: Colors.purple,
// // // // //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // // //                     shape: RoundedRectangleBorder(
// // // // //                       borderRadius: BorderRadius.circular(8),
// // // // //                     ),
// // // // //                   ),
// // // // //                   child: const Text("Send"),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }


// // // // import 'package:flutter/material.dart';
// // // // import 'package:timeago/timeago.dart' as timeago;

// // // // class CommentsPage extends StatefulWidget {
// // // //   @override
// // // //   _CommentsPageState createState() => _CommentsPageState();
// // // // }

// // // // class _CommentsPageState extends State<CommentsPage> {
// // // //   final TextEditingController _commentController = TextEditingController();
// // // //   final List<Map<String, dynamic>> _comments = []; // Stores comments with timestamps

// // // //   void _addComment(String comment) {
// // // //     final timestamp = DateTime.now();
// // // //     setState(() {
// // // //       _comments.insert(0, {'comment': comment, 'timestamp': timestamp});
// // // //     });
// // // //     _commentController.clear();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Comments'),
// // // //         backgroundColor: Colors.purple,
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           // Comments List
// // // //           Expanded(
// // // //             child: _comments.isEmpty
// // // //                 ? Center(
// // // //                     child: Text(
// // // //                       'No comments yet. Add one!',
// // // //                       style: TextStyle(color: Colors.grey, fontSize: 16),
// // // //                     ),
// // // //                   )
// // // //                 : ListView.builder(
// // // //                     itemCount: _comments.length,
// // // //                     itemBuilder: (context, index) {
// // // //                       final commentData = _comments[index];
// // // //                       final timeAgo = timeago.format(commentData['timestamp']);
// // // //                       return Padding(
// // // //                         padding: const EdgeInsets.symmetric(
// // // //                             horizontal: 16.0, vertical: 8.0),
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text(
// // // //                               commentData['comment'],
// // // //                               style: TextStyle(fontSize: 16),
// // // //                             ),
// // // //                             SizedBox(height: 4),
// // // //                             Text(
// // // //                               timeAgo,
// // // //                               style: TextStyle(
// // // //                                 fontSize: 12,
// // // //                                 color: Colors.grey,
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       );
// // // //                     },
// // // //                   ),
// // // //           ),
// // // //           // Comment Input
// // // //           Container(
// // // //             padding: EdgeInsets.all(8.0),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               boxShadow: [
// // // //                 BoxShadow(
// // // //                   color: Colors.black12,
// // // //                   offset: Offset(0, -1),
// // // //                   blurRadius: 4,
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             child: Row(
// // // //               children: [
// // // //                 Expanded(
// // // //                   child: TextField(
// // // //                     controller: _commentController,
// // // //                     decoration: InputDecoration(
// // // //                       hintText: 'Write a comment...',
// // // //                       border: OutlineInputBorder(
// // // //                         borderRadius: BorderRadius.circular(8),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   icon: Icon(Icons.send, color: Colors.purple),
// // // //                   onPressed: () {
// // // //                     if (_commentController.text.trim().isNotEmpty) {
// // // //                       _addComment(_commentController.text.trim());
// // // //                     }
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     home: CommentsPage(),
// // // //     theme: ThemeData(primarySwatch: Colors.purple),
// // // //   ));
// // // // }


// // // import 'package:flutter/material.dart';
// // // import 'package:timeago/timeago.dart' as timeago;

// // // class CommentsPage extends StatefulWidget {
// // //   @override
// // //   _CommentsPageState createState() => _CommentsPageState();
// // // }

// // // class _CommentsPageState extends State<CommentsPage> {
// // //   final TextEditingController _commentController = TextEditingController();
// // //   final List<Map<String, dynamic>> _comments = []; // Stores comments with timestamps

// // //   void _addComment(String comment) {
// // //     final timestamp = DateTime.now();
// // //     setState(() {
// // //       _comments.insert(0, {
// // //         'comment': comment,
// // //         'timestamp': timestamp,
// // //         'user': 'User ${_comments.length + 1}', // Placeholder user
// // //         'avatar': 'https://via.placeholder.com/150' // Placeholder avatar
// // //       });
// // //     });
// // //     _commentController.clear();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Comments'),
// // //         backgroundColor: Colors.purple,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           // Comments List
// // //           Expanded(
// // //             child: _comments.isEmpty
// // //                 ? Center(
// // //                     child: Text(
// // //                       'No comments yet. Be the first to comment!',
// // //                       style: TextStyle(color: Colors.grey, fontSize: 16),
// // //                     ),
// // //                   )
// // //                 : ListView.builder(
// // //                     itemCount: _comments.length,
// // //                     itemBuilder: (context, index) {
// // //                       final commentData = _comments[index];
// // //                       final timeAgo = timeago.format(commentData['timestamp']);
// // //                       return Padding(
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 16.0, vertical: 8.0),
// // //                         child: Row(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             // User Avatar
// // //                             CircleAvatar(
// // //                               backgroundImage: NetworkImage(commentData['avatar']),
// // //                               radius: 24,
// // //                             ),
// // //                             SizedBox(width: 12),
// // //                             // Comment Details
// // //                             Expanded(
// // //                               child: Column(
// // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                                 children: [
// // //                                   // User Name
// // //                                   Text(
// // //                                     commentData['user'],
// // //                                     style: TextStyle(
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 14,
// // //                                     ),
// // //                                   ),
// // //                                   SizedBox(height: 4),
// // //                                   // Comment Text
// // //                                   Text(
// // //                                     commentData['comment'],
// // //                                     style: TextStyle(fontSize: 16),
// // //                                   ),
// // //                                   SizedBox(height: 4),
// // //                                   // Time Ago
// // //                                   Text(
// // //                                     timeAgo,
// // //                                     style: TextStyle(
// // //                                       fontSize: 12,
// // //                                       color: Colors.grey,
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       );
// // //                     },
// // //                   ),
// // //           ),
// // //           // Comment Input
// // //           Container(
// // //             padding: EdgeInsets.all(8.0),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: Colors.black12,
// // //                   offset: Offset(0, -1),
// // //                   blurRadius: 4,
// // //                 ),
// // //               ],
// // //             ),
// // //             // child: Row(
// // //             //   children: [
// // //             //     // Comment Input Field
// // //             //     Expanded(
// // //             //       child: TextField(
// // //             //         controller: _commentController,
// // //             //         decoration: InputDecoration(
// // //             //           hintText: 'Write a comment...',
// // //             //           border: OutlineInputBorder(
// // //             //             borderRadius: BorderRadius.circular(8),
// // //             //           ),
// // //             //         ),
// // //             //       ),
// // //             //     ),
// // //             //     // Send Button
// // //             //     IconButton(
// // //             //       icon: Icon(Icons.send, color: Colors.purple),
// // //             //       onPressed: () {
// // //             //         if (_commentController.text.trim().isNotEmpty) {
// // //             //           _addComment(_commentController.text.trim());
// // //             //         }
// // //             //       },
// // //             //     ),
// // //             //   ],
// // //             // ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }




// // import 'package:flutter/material.dart';
// // import 'package:timeago/timeago.dart' as timeago;

// // class CommentsPage extends StatelessWidget {
// //   final List<Map<String, dynamic>> _comments = [
// //     {
// //       'comment': 'This is a great post! Thanks for sharing.',
// //       'timestamp': DateTime.now().subtract(Duration(minutes: 10)),
// //       'user': 'John Doe',
// //       'avatar': 'https://via.placeholder.com/150',
// //       'replies': [
// //         {
// //           'comment': 'I agree, this was very helpful.',
// //           'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
// //           'user': 'Jane Smith',
// //           'avatar': 'https://via.placeholder.com/150',
// //         },
// //         {
// //           'comment': 'Thank you for your feedback!',
// //           'timestamp': DateTime.now().subtract(Duration(minutes: 3)),
// //           'user': 'Author',
// //           'avatar': 'https://via.placeholder.com/150',
// //         },
// //       ],
// //     },
// //     {
// //       'comment': 'Can you share more details on this topic?',
// //       'timestamp': DateTime.now().subtract(Duration(hours: 1)),
// //       'user': 'Alice Brown',
// //       'avatar': 'https://via.placeholder.com/150',
// //       'replies': [
// //         {
// //           'comment': 'Sure, I’ll post an update soon!',
// //           'timestamp': DateTime.now().subtract(Duration(minutes: 30)),
// //           'user': 'Author',
// //           'avatar': 'https://via.placeholder.com/150',
// //         },
// //       ],
// //     },
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Comments'),
// //         backgroundColor: Colors.purple,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: _comments.isEmpty
// //             ? Center(
// //                 child: Text(
// //                   'No comments yet. Be the first to comment!',
// //                   style: TextStyle(color: Colors.grey, fontSize: 16),
// //                 ),
// //               )
// //             : ListView.builder(
// //                 itemCount: _comments.length,
// //                 itemBuilder: (context, index) {
// //                   final commentData = _comments[index];
// //                   final timeAgo = timeago.format(commentData['timestamp']);
// //                   return Card(
// //                     elevation: 2,
// //                     margin: const EdgeInsets.symmetric(vertical: 8.0),
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(12.0),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Row(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               // User Avatar
// //                               CircleAvatar(
// //                                 backgroundImage:
// //                                     NetworkImage(commentData['avatar']),
// //                                 radius: 24,
// //                               ),
// //                               SizedBox(width: 12),
// //                               // Comment Details
// //                               Expanded(
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Text(
// //                                       commentData['user'],
// //                                       style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         fontSize: 16,
// //                                       ),
// //                                     ),
// //                                     SizedBox(height: 4),
// //                                     Text(
// //                                       commentData['comment'],
// //                                       style: TextStyle(fontSize: 14),
// //                                     ),
// //                                     SizedBox(height: 4),
// //                                     Text(
// //                                       timeAgo,
// //                                       style: TextStyle(
// //                                         fontSize: 12,
// //                                         color: Colors.grey,
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           // Replies
// //                           if (commentData['replies'].isNotEmpty) ...[
// //                             Divider(),
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 40.0),
// //                               child: Column(
// //                                 children: commentData['replies']
// //                                     .map<Widget>((reply) {
// //                                   final replyTimeAgo =
// //                                       timeago.format(reply['timestamp']);
// //                                   return Padding(
// //                                     padding: const EdgeInsets.only(top: 8.0),
// //                                     child: Row(
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                       children: [
// //                                         // Reply Avatar
// //                                         CircleAvatar(
// //                                           backgroundImage: NetworkImage(
// //                                               reply['avatar']),
// //                                           radius: 20,
// //                                         ),
// //                                         SizedBox(width: 12),
// //                                         Expanded(
// //                                           child: Column(
// //                                             crossAxisAlignment:
// //                                                 CrossAxisAlignment.start,
// //                                             children: [
// //                                               Text(
// //                                                 reply['user'],
// //                                                 style: TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                   fontSize: 14,
// //                                                 ),
// //                                               ),
// //                                               SizedBox(height: 4),
// //                                               Text(
// //                                                 reply['comment'],
// //                                                 style: TextStyle(fontSize: 14),
// //                                               ),
// //                                               SizedBox(height: 4),
// //                                               Text(
// //                                                 replyTimeAgo,
// //                                                 style: TextStyle(
// //                                                   fontSize: 12,
// //                                                   color: Colors.grey,
// //                                                 ),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                         ),
// //                                       ],
// //                                     ),
// //                                   );
// //                                 }).toList(),
// //                               ),
// //                             ),
// //                           ],
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:timeago/timeago.dart' as timeago;

// class CommentsPage extends StatelessWidget {
//   final List<Map<String, dynamic>> _comments = [
//     {
//       'comment': 'This is a great post! Thanks for sharing.',
//       'timestamp': DateTime.now().subtract(Duration(minutes: 10)),
//       'user': 'John Doe',
//       'avatar': 'https://via.placeholder.com/150',
//       'replies': [
//         {
//           'comment': 'I agree, this was very helpful.',
//           'timestamp': DateTime.now().subtract(Duration(minutes: 5)),
//           'user': 'Jane Smith',
//           'avatar': 'https://via.placeholder.com/150',
//         },
//         {
//           'comment': 'Thank you for your feedback!',
//           'timestamp': DateTime.now().subtract(Duration(minutes: 3)),
//           'user': 'Author',
//           'avatar': 'https://via.placeholder.com/150',
//         },
//       ],
//     },
//     {
//       'comment': 'Can you share more details on this topic?',
//       'timestamp': DateTime.now().subtract(Duration(hours: 1)),
//       'user': 'Alice Brown',
//       'avatar': 'https://via.placeholder.com/150',
//       'replies': [
//         {
//           'comment': 'Sure, I’ll post an update soon!',
//           'timestamp': DateTime.now().subtract(Duration(minutes: 30)),
//           'user': 'Author',
//           'avatar': 'https://via.placeholder.com/150',
//         },
//       ],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: _comments.isEmpty
//             ? Center(
//                 child: Text(
//                   'No comments yet. Be the first to comment!',
//                   style: TextStyle(color: Colors.grey, fontSize: 16),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: _comments.length,
//                 itemBuilder: (context, index) {
//                   final commentData = _comments[index];
//                   return CommentCard(commentData: commentData);
//                 },
//               ),
//       ),
//     );
//   }
// }

// class CommentCard extends StatefulWidget {
//   final Map<String, dynamic> commentData;

//   const CommentCard({Key? key, required this.commentData}) : super(key: key);

//   @override
//   _CommentCardState createState() => _CommentCardState();
// }

// class _CommentCardState extends State<CommentCard> {
//   bool isRepliesVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     final commentData = widget.commentData;
//     final timeAgo = timeago.format(commentData['timestamp']);

//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Main Comment
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // User Avatar
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(commentData['avatar']),
//                   radius: 24,
//                 ),
//                 SizedBox(width: 12),
//                 // Comment Details
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         commentData['user'],
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         commentData['comment'],
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         timeAgo,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             // Show Replies Button
//             if (commentData['replies'].isNotEmpty)
//               Align(
//                 alignment: Alignment.centerLeft,
                
//                 child: TextButton(
//                   onPressed: () {
//                     setState(() {
//                       isRepliesVisible = !isRepliesVisible;
//                     });
//                   },
//                   child: Text(
//                     isRepliesVisible ? ' Replies' : ' Replies',
//                     style: TextStyle(color: Colors.purple),
//                   ),
//                 ),
//               ),
//             // Replies Section
//             if (isRepliesVisible)
//               Padding(
//                 padding: const EdgeInsets.only(left: 40.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Divider(),
//                     // Text(
//                     //   'Replies',
//                     //   style: TextStyle(
//                     //     fontSize: 14,
//                     //     fontWeight: FontWeight.bold,
//                     //     color: Colors.purple,
//                     //   ),
//                     // ),
//                     ...commentData['replies'].map<Widget>((reply) {
//                       final replyTimeAgo =
//                           timeago.format(reply['timestamp']);
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Reply Avatar
//                             CircleAvatar(
//                               backgroundImage: NetworkImage(reply['avatar']),
//                               radius: 20,
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     reply['user'],
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     reply['comment'],
//                                     style: TextStyle(fontSize: 14),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     replyTimeAgo,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
