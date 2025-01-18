
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider to store the selected project ID
final selectedProjectIdProvider = StateProvider<int?>((ref) => null);
// print(selectedProjectIdProvider);

final selectProjectTitleProvider = StateProvider<String?>((ref) => null); 
final selectedProjectDescProvider = StateProvider<String?>((ref) => null);