import 'package:riverpod/riverpod.dart';
import 'package:vamos_cartographie/backend/core/backend_controller.dart';
import 'package:vamos_cartographie/backend/core/backend_registry.dart';
import "package:vamos_cartographie/core/config/app_config.dart";

final backendControllerProvider = Provider<BackendController>((ref) {
  final factory = BackendRegistry.resolve(AppConfig.environment);
  return BackendController(factory);
});
