import 'package:ferry/ferry.dart';
import 'package:riverpod/riverpod.dart';
import "backend_controller_provider.dart";

final clientProvider = Provider<Client>((ref) {
  return ref.watch(backendControllerProvider).client;
});
