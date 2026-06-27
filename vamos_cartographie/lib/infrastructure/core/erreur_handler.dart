import 'package:vamos_cartographie/core/injection/notification_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHandler {
  // Pattern Singleton classique
  ErrorHandler._privateConstructor();
  static final ErrorHandler instance = ErrorHandler._privateConstructor();

  // On garde une référence tardive (late) du conteneur Riverpod
  late final ProviderContainer _container;

  void init(ProviderContainer container) {
    _container = container;
  }

  void handle(Object error, StackTrace? stackTrace) {
    // 1. Log l'erreur dans ta console ou sur un outil comme Crashlytics
    print('Erreur capturée globalement : $error');

    // 2. Déclenche la notification système via Riverpod
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
