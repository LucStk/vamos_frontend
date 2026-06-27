import 'package:domain_core/failure.dart';
import 'package:vamos_cartographie/infrastructure/core/exception_mapper.dart';

class ErrorHandler {
  ErrorHandler._();
  static final instance = ErrorHandler._();

  void handle(Object error, StackTrace? stackTrace) {
    final Failure failure = ExceptionMapper.fromException(error, stackTrace);
    print("[${failure.message}] ${failure.props}");
    // analytics / crash reporting
    // Crashlytics.instance.recordError(...)
  }
}
