// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app.dart';
import 'package:vamos_cartographie/core/injection.dart'; // Ton fichier où se trouve configureDependencies

Future<void> main() async {
  // 1. Obligatoire si tu fais du async avant runApp (ex: GetIt, SharedPreferences, etc.)
  WidgetsFlutterBinding.ensureInitialized();
  debugProfileBuildsEnabled = true;
  // 2. On initialise GetIt (chargement de tes repositories, dépendances...)
  await configureDependencies();

  // 3. On lance l'application enveloppée dans le ProviderScope de Riverpod
  runApp(const ProviderScope(child: CartographieApp()));
}
