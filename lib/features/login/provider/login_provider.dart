import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/route.dart';


import 'package:time_sheet_app/features/login/model/user_login_model.dart';
import 'package:time_sheet_app/features/login/services/login_services.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';


final loginProvider = NotifierProvider<LoginProvider, bool>(
  () => LoginProvider(),
);

class LoginProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<void> loginUser(
      {required BuildContext context, required  UserLoginModel loginData}) async {
        state = true;
          final loginServices =
        ref.read(loginServiceProvider); // Access LoginServices
    final sharedPrefServices = ref.read(sharedPrefServicesProvider); 
      final result = await loginServices.loginUser(data: loginData);
      result.fold(
      (failure) {
        // Handle login failure
        state = false;
        showErrorSnackbar(message: failure.message, context: context);
      },
      (success) {
        // Handle successful login
        state = false;
        sharedPrefServices.saveToken(token: success.accessToken);
        if (context.mounted) {
          context.go(AppRoute.home); // Navigate to main app route
        }
      },
    );
  }
}