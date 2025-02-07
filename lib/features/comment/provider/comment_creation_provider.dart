import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/comment/model/comment_creation_model.dart';
import 'package:time_sheet_app/features/comment/service/comment_creation_service.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final commentCreationProvider = NotifierProvider<CommentCreationProvider, bool>(
  () => CommentCreationProvider(),
);

class CommentCreationProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }
 Future<void> getComment({
    required BuildContext context,
    required CommentCreationModel commentData,
  }) async {
    state = true;

    final commentServices = ref.read(commentCreationServiceProvider);
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);
    final token = await sharedPrefServices.getToken(); // Retrieve token

    if (token == null || token.isEmpty) {
      state = false;
      showErrorSnackbar(
          message: "User not authenticated. Please log in.", context: context);
      return;
    }

    final result =
        await commentServices.createComment(data: commentData, token: token);

    result.fold(
      (failure) {
        state = false;
        showErrorSnackbar(message: failure.message, context: context);
      },
      (success) {
        state = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Comment posted successfully!")),
        );
      },
    );
  }

  // Future<void> getComment({
  //   required BuildContext context,
  //   required CommentCreationModel commentData,
  // }) async {
  //   state = true;
  //   final commentServices = ref.read(commentCreationServiceProvider);
  //   final sharedPrefServices = ref.read(sharedPrefServicesProvider);
  //   final token = await sharedPrefServices.getToken(); // Retrieve token

  //   if (token == null) {
  //     state = false;
  //     showErrorSnackbar(message: "Token not found", context: context);
  //     return;
  //   }

  //   final result =
  //       await commentServices.createComment(data: commentData, token: token);

  //   result.fold(
  //     (failure) {
  //       state = false;
  //       showErrorSnackbar(message: failure.message, context: context);
  //     },
  //     (success) {
  //       state = false;
  //       // Handle success (e.g., show success message, update UI, etc.)
  //     },
  //   );
  // }
}
