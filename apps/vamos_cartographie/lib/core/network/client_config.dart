import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class ClientConfig {
  static String get url => dotenv.env['BACKEND_URL'] ?? '';

  static void validate() {
    if (url.isEmpty) {
      throw StateError('SUPABASE_URL is not configured.');
    }
  }
}
