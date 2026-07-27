import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import "package:domain_core/domain_core.dart";

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/services/services.dart';
import 'package:vamos_cartographie/notification/notification.dart';

// core/erreur_handler.dart
Future<Either<Failure, T>> guard<T>(Future<T> Function() action) async {
  try {
    return Right(await action());
  } catch (e, s) {
    print("guarde keep $e");
    return Left(ExceptionMapper.fromException(e, s));
  }
}

class ErrorHandler implements ErrorLogger {
  // Pattern Singleton classique
  ErrorHandler._privateConstructor();
  static final ErrorHandler instance = ErrorHandler._privateConstructor();

  // On garde une référence tardive (late) du conteneur Riverpod
  late final ProviderContainer _container;

  void init(ProviderContainer container) {
    _container = container;
  }

  @override
  void logError(Failure failure, [StackTrace? stackTrace]) {
    handle(failure, stackTrace);
  }

  void handle(Object error, StackTrace? stackTrace) {
    // On limite par exemple aux 5 premières lignes si la stacktrace existe
    final limitedStackTrace = stackTrace != null
        ? stackTrace.toString().split('\n').take(5).join('\n')
        : 'Pas de StackTrace';

    debugPrint('Erreur capturée globalement : $error ->\n$stackTrace');

    // 2. Déclenche la notification système via Riverpod
    _container
        .read(notificationQueueProvider.notifier)
        .show(
          message: 'Une erreur inattendue est survenue : $error',
          type: NotificationType.error,
          duration: const Duration(seconds: 5),
        );
  }
}
