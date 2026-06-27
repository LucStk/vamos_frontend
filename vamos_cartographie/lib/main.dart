import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/infrastructure/core/erreur_handler.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. On crée le conteneur manuellement ici
  final container = ProviderContainer();

  // 2. On le donne immédiatement à notre ErrorHandler
  ErrorHandler.instance.init(container);

  FlutterError.onError = (FlutterErrorDetails details) {
    ErrorHandler.instance.handle(details.exception, details.stack);
  };

  runZonedGuarded(
    () {
      runApp(
        // 3. On utilise UncontrolledProviderScope pour injecter notre conteneur
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
