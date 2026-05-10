import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise les dépendances de vamos_cartographie.
  // Le client Ferry est créé en interne (cache mémoire).
  // TODO: passer un client Ferry avec cache Hive persistant
  // une fois le support Linux de path_provider résolu.
  await configureDependencies();

  runApp(const CartographieApp());
}
