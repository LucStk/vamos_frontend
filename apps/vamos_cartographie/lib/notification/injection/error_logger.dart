import 'package:domain_core/notification/error_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/services/services.dart';

part 'error_logger.g.dart';

@riverpod
ErrorLogger errorLogger(Ref ref) {
  return ErrorHandler.instance;
}
