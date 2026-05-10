import 'package:flutter/material.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
import 'package:get_it/get_it.dart';
import 'package:vamos_ui/core/services/ferry_client.dart';
import 'package:ferry/ferry.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  final client = await initClient();
  getIt.registerSingleton<Client>(client);
}

void main() async {
  await setup();
  runApp(const CartographieApp());
}
