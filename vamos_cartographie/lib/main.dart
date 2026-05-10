import 'package:flutter/material.dart';
import 'app.dart';
import 'core/injection.dart';

void main() async {
  // Obligatoire si tu fais du async avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // On initialise GetIt
  await configureDependencies();

  runApp(const CartographieApp());
}
