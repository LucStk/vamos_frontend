import 'package:riverpod/riverpod.dart';
import 'package:vamos_cartographie/backend/core/network/network.dart';
import "backend_controller_provider.dart";

final storageDatasourceProvider = Provider<StorageDatasource>((ref) {
  return ref.watch(backendControllerProvider).storageDatasource;
});
