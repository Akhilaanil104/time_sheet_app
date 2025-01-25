import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';

import 'package:time_sheet_app/features/comment/models/comments_display_model.dart';
import 'package:time_sheet_app/features/comment/services/comment_creation_service.dart';

import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

 final commentCreationProvider =
    NotifierProvider<CommentCreationProvider, bool>(() => CommentCreationProvider());
class CommentCreationProvider extends Notifier<bool> {
  @override
  bool build() {
    return false; // Initial state, not loading
  }

  Future<void> createComment({
    required BuildContext context,
    required CommentModel commentData,
    required int taskId,
  }) async {
    state = true; // Set loading state to true
    final commentServices = ref.read(CommentServiceProvider); 
     final sharedPrefServices = ref.read(sharedPrefServicesProvider);

     try{
       final token = await sharedPrefServices.getToken();
      if (token == null) {
        showErrorSnackbar(
          message: "User not authenticated or token not found.",
          context: context,
        );
        return;
      }
        final result = await commentServices.postComment(
        data: commentData,
        token: token,
        taskId: taskId,
      );


      result.fold(
        (failure) {
          showErrorSnackbar(message: failure.message, context: context);
        },
        (success) {
          // Store the ID in the provider
        

          if (context.mounted) {
            context.go(AppRouter.home);
          }
        },
      );
    } catch (e) {
      showErrorSnackbar(
        message: "An error occurred: $e",
        context: context,
      );
    } finally {
      state = false;
    }
  }
}