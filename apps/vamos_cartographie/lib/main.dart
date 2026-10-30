import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vamos_cartographie/core/log/log_observer.dart';

import 'app.dart';
import 'core/config/config.dart';
import 'core/erreur_handler.dart';

void main() {
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
          child: CartographieApp(),
        ),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}
