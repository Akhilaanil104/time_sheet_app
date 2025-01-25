import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/features/comment/models/comments_add_model.dart';
import 'package:time_sheet_app/features/comment/models/comments_display_model.dart';
import 'package:time_sheet_app/features/comment/provider/comment_display_provider.dart';

class CommentDisplayView extends ConsumerStatefulWidget {
  final int taskId;

  const CommentDisplayView({super.key, required this.taskId});

  @override
  _CommentDisplayViewState createState() => _CommentDisplayViewState();
}

class _CommentDisplayViewState extends ConsumerState<CommentDisplayView> {
  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _fetchComments() async {
    await ref.read(commentDisplayProvider.notifier).fetchComment(
          context: context,
          taskId: widget.taskId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final commentsState = ref.watch(commentDisplayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: RefreshIndicator(
        onRefresh: _fetchComments,
        child: commentsState.isLoading && commentsState.comments.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : commentsState.comments.isEmpty
                ? const Center(child: Text('No comments available.'))
                : ListView.builder(
                    itemCount: commentsState.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentsState.comments[index];
                      return CommentTile(comment: comment);
                    },
                  ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final CommentModel comment;

  const CommentTile({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: ExpansionTile(
          title: Text(
            comment.comment,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Commenter ID: ${comment.commenter} • ${comment.timestamp}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          children: [
            if (comment.replies.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comment.replies.length,
                itemBuilder: (context, index) {
                  final reply = comment.replies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.reply, size: 20, color: Colors.grey),
                      title: Text(reply.comment),
                      subtitle: Text(
                        "Reply by: ${reply.commenter} • ${reply.timestamp}",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  );
                },
              )
            else
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No replies yet.',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}