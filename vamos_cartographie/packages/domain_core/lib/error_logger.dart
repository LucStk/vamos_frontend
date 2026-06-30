// Dans ton package pur (ex: lib/services/error_logger.dart)
// domain_core ou media_application
import 'package:domain_core/failure.dart';

abstract interface class ErrorLogger {
  void logError(Failure failure, [StackTrace? stackTrace]);
}
