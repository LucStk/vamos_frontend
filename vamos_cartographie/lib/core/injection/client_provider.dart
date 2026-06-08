import 'package:ferry/ferry.dart';
import 'package:riverpod/riverpod.dart';
import "backend_factory_provider.dart";

final clientProvider = Provider<Client>((ref) {
  return ref.watch(backendFactoryProvider).createClient();
});
