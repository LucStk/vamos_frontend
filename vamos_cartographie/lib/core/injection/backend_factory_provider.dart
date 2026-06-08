import 'package:riverpod/riverpod.dart';
import "package:vamos_cartographie/core/network/graphql/backend/backend_factory.dart";
import "package:vamos_cartographie/core/network/graphql/backend/config/app_config.dart";
import "package:vamos_cartographie/core/network/graphql/backend/backend_registry.dart";

final backendFactoryProvider = Provider<BackendFactory>((ref) {
  final env = AppConfig.environment;

  return BackendRegistry.resolve(env);
});
