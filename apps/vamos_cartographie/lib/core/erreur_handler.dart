import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import "package:domain_core/domain_core.dart";

import 'package:stack_trace/stack_trace.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/exceptions_mappers.dart';
import 'package:vamos_cartographie/core/errors/exceptions_mappers/graphql_error_mapper.dart';

Future<Either<Failure, T>> guard<T>(
  Future<T> Function() action, {
  GraphQLErrorsMapper? graphqlMapper,
}) async {
  try {
    return Right(await action());
  } catch (e, s) {
    final failure = ExceptionMapper.fromException(
      e,
      stackTrace: s,
      graphqlMapper: graphqlMapper,
    );
    debugPrint('guard caught: $failure');
    return Left(failure);
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
    if (stackTrace != null) {
      // Convertit en objet Trace puis prend les 15 premiers frames
      final trace = Trace.from(stackTrace);
      final limitedTrace = Trace(trace.frames.take(6));

      debugPrint('Erreur capturée : $error ->\n$limitedTrace');
    } else {
      debugPrint('Erreur capturée : $error -> Pas de StackTrace');
    }
    // 2. Déclenche la notification système via Riverpod
    // _container
    //     .read(notificationQueueProvider.notifier)
    //     .show(
    //       message: 'Une erreur inattendue est survenue : $error',
    //       type: NotificationType.error,
    //       duration: const Duration(seconds: 5),
    //     );
  }
}
