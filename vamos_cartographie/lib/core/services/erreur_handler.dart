import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import "package:domain_core/domain_core.dart";

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/injection/injection.dart';
import 'package:vamos_cartographie/core/services/services.dart';

// core/erreur_handler.dart
Future<Either<Failure, T>> guard<T>(Future<T> Function() action) async {
  try {
    return Right(await action());
  } catch (e, s) {
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
    debugPrint('Erreur capturée globalement : $error ->\n $stackTrace');

    //    2. Déclenche la notification système via Riverpod
    _container
        .read(notificationQueueProvider.notifier)
        .show(
          message: 'Une erreur inattendue est survenue : $error',
          type: NotificationType.error,
          duration: const Duration(
            seconds: 5,
          ), // Plus long pour une erreur critique
        );
  }
}
