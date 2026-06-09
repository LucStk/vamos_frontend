import 'package:riverpod/riverpod.dart';
import "package:vamos_cartographie/core/backend/backend_controller.dart";
import "package:vamos_cartographie/core/config/app_config.dart";
import 'package:vamos_cartographie/core/backend/backend_registry.dart';

final backendControllerProvider = Provider<BackendController>((ref) {
  final factory = BackendRegistry.resolve(AppConfig.environment);
  return BackendController(factory);
});
