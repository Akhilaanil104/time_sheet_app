import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/comment/models/comments_add_model.dart';
import 'package:time_sheet_app/features/comment/models/comments_display_model.dart';
import 'package:time_sheet_app/features/comment/services/comment_display_services.dart';

// Define a model to hold the comments and loading state
class CommentState {
  final bool isLoading;
  final List<CommentModel> comments;

  CommentState({this.isLoading = false, this.comments = const []});

  CommentState copyWith({bool? isLoading, List<CommentModel>? comments}) {
    return CommentState(
      isLoading: isLoading ?? this.isLoading,
      comments: comments ?? this.comments,
    );
  }
}

// Provider for the comments state
final commentDisplayProvider =
    NotifierProvider<CommentDisplayProvider, CommentState>(
        () => CommentDisplayProvider());

class CommentDisplayProvider extends Notifier<CommentState> {
  @override
  CommentState build() {
    return CommentState();
  }

  Future<void> fetchComment({
    required BuildContext context,
    required int taskId,
  }) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final commentService = ref.watch(commentDisplayServiceProvider);
    final token = await sharedPrefServices.getToken();
    final employeeId = await sharedPrefServices.getUserId();

    if (token == null || employeeId == null) {
      // Handle missing token or employeeId
      state = state.copyWith(isLoading: false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong.")),
      );
      return;
    }

    // Update state to show loading
    state = state.copyWith(isLoading: true);

    try {
      final result =
          await commentService.getComments(token, taskId, employeeId);

      result.fold(
        (failure) {
          // Handle failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failure.message)),
          );
        },
        (comments) {
          // Update state with fetched comments
          state = state.copyWith(comments: comments, isLoading: false);
        },
      );
    } catch (e) {
      // Handle unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred: $e")),
      );
    } finally {
      // Ensure loading is set to false
      state = state.copyWith(isLoading: false);
    }
  }
}