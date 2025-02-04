import 'package:flutter_riverpod/flutter_riverpod.dart';

/// **Global provider to store the Timesheet ID from the API response**
final timesheetIdProvider = StateProvider<int?>((ref) => null);
