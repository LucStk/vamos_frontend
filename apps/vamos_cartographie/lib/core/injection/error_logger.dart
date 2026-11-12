import 'package:domain_core/domain_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../erreur_handler.dart';

part 'error_logger.g.dart';

@Riverpod(keepAlive: true)
ErrorLogger errorLogger(Ref ref) {
  return ErrorHandler.instance;
}
