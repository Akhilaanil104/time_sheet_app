import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/register/models/user_registration_model.dart';
import 'package:time_sheet_app/features/register/services/register_service.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final registerProvider =
    NotifierProvider<RegisterProvider, bool>(() => RegisterProvider());

class RegisterProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<void> registerUser({
    required BuildContext context,
    required UserRegistrationModel data,
  }) async {
    state = true;
    final registerServices =
        ref.read(registerServiceProvider); // Access RegisterServices
    final sharedPrefServices = ref.read(sharedPrefServicesProvider);

    final result = await registerServices.userRegister(data: data);
    result.fold(
      (failure) {
        state = false;
        showErrorSnackbar(message: failure.message, context: context);
      },
      (success) {
        state = false;
        sharedPrefServices.saveToken(token: success.accessToken);
        if (context.mounted) {
          context.go(AppRouter.home); // Navigate to the main app route
        }
      },
    );
  }
}
