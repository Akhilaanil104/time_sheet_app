
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/features/profile/model/profile_model.dart';
import 'package:time_sheet_app/features/profile/services/profile_services.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

final userProfilesProvider = StateNotifierProvider<UserProfilesNotifier, List<ProfileModel>>(
  (ref) => UserProfilesNotifier(ref),
);

class UserProfilesNotifier extends StateNotifier<List<ProfileModel>> {
  final Ref ref;
  UserProfilesNotifier(this.ref) : super([]);

  /// Fetch User Profiles from API and update state
  Future<void> fetchUserProfiles({required BuildContext context}) async {
  final sharedPrefServices = ref.read(sharedPrefServicesProvider);
  final userProfileService = ref.read(userProfileServicesProvider);

  final token = await sharedPrefServices.getToken();
  final employeeId = await sharedPrefServices.getEmployeeId();

  if (token == null || employeeId == null) {
    print("❌ Token or Employee ID is null!");
    showErrorSnackbar(message: "User not authenticated or employee ID not found.", context: context);
    return;
  }

  try {
    final result = await userProfileService.getUserProfile(token, employeeId);
    result.fold(
      (failure) {
        print("❌ Fetching Error: ${failure.message}");
        showErrorSnackbar(message: failure.message, context: context);
      },
      (profiles) {
        print("✅ API Data Received in Provider: ${profiles.map((p) => p.toJson())}"); // Debugging

        if (profiles.isEmpty) {
          print("⚠️ No profiles found in API response!");
          showErrorSnackbar(message: "No profiles found.", context: context);
        } else {
          state = profiles; // ✅ Updating provider state
          print("✅ Provider State Updated!");
        }
      },
    );
  } catch (e) {
    print("❌ Unexpected Error: $e");
    showErrorSnackbar(message: "An unexpected error occurred: $e", context: context);
  }
}


}
