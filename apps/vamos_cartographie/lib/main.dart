import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/config/supabase.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: ".env");
      final container = ProviderContainer();

      ErrorHandler.instance.init(container);

      FlutterError.onError = (FlutterErrorDetails details) {
        ErrorHandler.instance.handle(details.exception, details.stack);
      };

      SupabaseConfig.validate();
      await SupabaseService.initialize();

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: CartographieApp(),
        ),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}
