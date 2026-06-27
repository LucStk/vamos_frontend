// lib/main.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app.dart';
import 'package:vamos_cartographie/infrastructure/core/erreur_handler.dart';
import 'package:vamos_cartographie/infrastructure/core/exception_mapper.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    ErrorHandler.instance.handle(details, details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () {
      runApp(ProviderScope(child: CartographieApp()));
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}
