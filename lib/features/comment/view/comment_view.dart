import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';

import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';


class CommentsView extends ConsumerStatefulWidget {
  final int taskId;

  const CommentsView({super.key, required this.taskId});

  @override
  ConsumerState<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends ConsumerState<CommentsView> {
  @override
  Widget build(BuildContext context) {
    final comments = ref.watch(displyCommentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: comments.isEmpty
          ? const Center(child: Text("No comments available"))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentTile(comment: comment);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(displyCommentProvider.notifier).fetchComment(
                context: context,
                taskId: widget.taskId,
              );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final CommentDisplayModel comment;

  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${comment.senderName} → ${comment.receiverName}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(comment.comment),
            const SizedBox(height: 5),
            Text(
              "Posted on: ${comment.createdAt.toLocal()}",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}