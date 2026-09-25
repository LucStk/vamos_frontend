import 'package:domain_core/notification/error_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';

part 'error_logger.g.dart';

@Riverpod(keepAlive: true)
ErrorLogger errorLogger(Ref ref) {
  return ErrorHandler.instance;
}
