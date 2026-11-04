import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app.dart';
import 'package:vamos_cartographie/core/config/supabase.dart';
import 'package:vamos_cartographie/core/config/supabase_config.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/dev/dev_root.dart';

import 'package:vamos_cartographie/routing/app_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

// import 'package:vamos_cartographie/core/log/log_observer.dart';

@Dependencies([router])
void main() {
  // debugRepaintRainbowEnabled = true;
  runZonedGuarded(
    () async {
      DevicePreview.enable();
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
          // En debug : F2 bascule entre format PC et aperçu smartphone.
          child: kReleaseMode
              ? CartographieApp()
              : DevRoot(app: CartographieApp()),
        ),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}
