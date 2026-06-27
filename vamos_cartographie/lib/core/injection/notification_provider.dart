import 'dart:collection';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Ne pas oublier d'ajouter cette ligne pour la génération de code !
// (Remplace 'notification_provider' par le nom exact de ton fichier .dart si besoin)
part 'notification_provider.g.dart';

enum NotificationType { success, error }

class AppNotification {
  final String message;
  final NotificationType type;
  final Duration duration;

  AppNotification({
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 3),
  });
}

// Avec Riverpod 3, l'annotation génère automatiquement le provider global
// sous le nom de 'notificationQueueProvider'.
@riverpod
class NotificationQueue extends _$NotificationQueue {
  final ListQueue<AppNotification> _queue = ListQueue<AppNotification>();
  bool _isDisplaying = false;

  @override
  AppNotification? build() {
    // Initialise l'état à null au démarrage
    return null;
  }

  /// Ajoute une notification à la file d'attente
  void show({
    required String message,
    required NotificationType type,
    Duration? duration,
  }) {
    _queue.add(
      AppNotification(
        message: message,
        type: type,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
    _checkQueue();
  }

  /// Passe à la notification suivante dès que l'actuelle est terminée
  void dismissCurrent() {
    state = null;
    _isDisplaying = false;
    // Un léger délai pour laisser l'animation de fermeture se faire avant la suivante
    Future.delayed(const Duration(milliseconds: 300), _checkQueue);
  }

  void _checkQueue() {
    if (_isDisplaying || _queue.isEmpty) return;

    _isDisplaying = true;
    state = _queue.removeFirst();

    // Planifie la fermeture automatique
    Future.delayed(state!.duration, () {
      // On vérifie si cette notification est toujours celle en cours
      if (_isDisplaying) {
        dismissCurrent();
      }
    });
  }
}
