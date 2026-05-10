import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

Future<Client> _buildFerryClient() async {
  // Initialise Hive (cache persistant sur disque)
  await Hive.initFlutter();
  final box = await Hive.openBox<Map<String, dynamic>>('ferry_cache');
  final store = HiveStore(box);

  final link = HttpLink('http://localhost:8000/graphql/');

  return Client(
    link: link,
    cache: Cache(store: store),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Construit le client Ferry avec cache Hive persistant
  final client = await _buildFerryClient();

  // Initialise les dépendances de vamos_cartographie
  // en lui passant notre client configuré
  await configureDependencies(client: client);

  runApp(const CartographieApp());
}
