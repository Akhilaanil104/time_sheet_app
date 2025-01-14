

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppSecrets {
  static String BACKEND_BASE_URL = dotenv.get('BACKEND_BASE_URL');
}
