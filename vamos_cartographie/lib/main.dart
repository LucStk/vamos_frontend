// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app.dart';
import 'package:vamos_cartographie/core/injection/client_provider.dart'; // Ton fichier où se trouve configureDependencies
import 'package:vamos_cartographie/core/network/graphql/ferry_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugProfileBuildsEnabled = true;

  final client = initFerryClient('http://localhost:8000/graphql/');

  runApp(
    ProviderScope(
      overrides: [clientProvider.overrideWithValue(client)],
      child: CartographieApp(),
    ),
  );
}
