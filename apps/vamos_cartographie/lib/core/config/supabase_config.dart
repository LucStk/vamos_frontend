import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class SupabaseConfig {
  static String get url => dotenv.env['SUPABASE_URL'] ?? '';

  static String get publishableKey =>
      dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? '';

  static void validate() {
    if (url.isEmpty) {
      throw StateError('SUPABASE_URL is not configured.');
    }

    if (publishableKey.isEmpty) {
      throw StateError('SUPABASE_PUBLISHABLE_KEY is not configured.');
    }
  }
}
