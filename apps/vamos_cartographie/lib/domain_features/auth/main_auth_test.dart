import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_entry_view.dart';
import 'package:vamos_cartographie/core/config/supabase.dart';
import 'package:vamos_cartographie/core/config/supabase_config.dart';
import '/core/core.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Charger le fichier .env
      await dotenv.load(fileName: ".env");

      // Valider la config et initialiser Supabase
      SupabaseConfig.validate();
      await SupabaseService.initialize();

      final container = ProviderContainer();
      ErrorHandler.instance.init(container);

      FlutterError.onError = (FlutterErrorDetails details) {
        ErrorHandler.instance.handle(details.exception, details.stack);
      };

      runApp(
        UncontrolledProviderScope(container: container, child: const MyApp()),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cartographie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AppEntryView(),
    );
  }
}
