import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/comment/model/comment_display_model.dart';

import 'package:time_sheet_app/features/comment/service/comment_display_service.dart';

import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final displyCommentProvider =
    NotifierProvider<DisplyCommentProvider, List<CommentDisplayModel>>(
  () => DisplyCommentProvider(),
);

class DisplyCommentProvider extends Notifier<List<CommentDisplayModel>> {
  @override
  List<CommentDisplayModel> build() {
    return [];
  }

  Future<void> fetchComment(
      {required BuildContext context, required int taskId}) async {
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final commentService = ref.read(commentDisplayServiceProvider);
    final token = await sharedPrefServices.getToken();
    if (token == null || taskId == null) {
      showErrorSnackbar(message: "Something went wrong", context: context);
      return;
    }

    try {
      final result =
          await commentService.getComments(token: token, taskId: taskId);
      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (comments) {
          state = comments;
        },
      );
    } catch (e) {
      showErrorSnackbar(
          message: "An expected error occurred: $e", context: context);
    }
  }
}