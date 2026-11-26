import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app.dart';
import 'package:vamos_cartographie/core/config/supabase.dart';
import 'package:vamos_cartographie/core/config/supabase_config.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';

// import 'package:vamos_cartographie/core/log/log_observer.dart';

/// Démarre l'app. Partagé par [main] (téléphone) et par `main_preview.dart`
/// (PC, avec aperçu smartphone). [wrap] enveloppe l'app racine.
void runVamos({Widget Function(Widget app)? wrap}) {
  // debugRepaintRainbowEnabled = true;
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await dotenv.load(fileName: ".env");
      final container = ProviderContainer(); //observers: [LogObserver()]);

      ErrorHandler.instance.init(container);

      FlutterError.onError = (FlutterErrorDetails details) {
        ErrorHandler.instance.handle(details.exception, details.stack);
      };

      SupabaseConfig.validate();
      await SupabaseService.initialize();

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: wrap == null ? CartographieApp() : wrap(CartographieApp()),
        ),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}
