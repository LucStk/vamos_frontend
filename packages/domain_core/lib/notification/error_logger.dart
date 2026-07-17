// Dans ton package pur (ex: lib/services/error_logger.dart)
// domain_core ou stored_file_application
import 'failure.dart';

abstract interface class ErrorLogger {
  void logError(Failure failure, [StackTrace? stackTrace]);
}
