import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config.dart';

abstract final class SupabaseService {
  static Future<void> initialize() async {
    SupabaseConfig.validate();

    await Supabase.initialize(
      url: SupabaseConfig.url,
      publishableKey: SupabaseConfig.publishableKey,
    );
  }

  static SupabaseClient get client {
    return Supabase.instance.client;
  }
}
