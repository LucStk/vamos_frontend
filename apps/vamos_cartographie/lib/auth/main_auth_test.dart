import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/config/supabase.dart';
import 'package:vamos_cartographie/core/config/supabase_config.dart';
import '/core/services/erreur_handler.dart';

// Imports de tes pages d'auth (ajuste les chemins si besoin)
import 'presentation/login_page.dart';
import 'presentation/register_page.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Charger le fichier .env en premier
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
        UncontrolledProviderScope(
          container: container,
          child: const AuthTestApp(),
        ),
      );
    },
    (error, stackTrace) {
      ErrorHandler.instance.handle(error, stackTrace);
    },
  );
}

class AuthTestApp extends StatelessWidget {
  const AuthTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPageWrapper(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

/// Wrapper pour afficher la LoginPage tout en ajoutant un lien vers la création de compte
class LoginPageWrapper extends StatelessWidget {
  const LoginPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LoginPage(),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
                child: const Text("Pas encore de compte ? S'inscrire"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
