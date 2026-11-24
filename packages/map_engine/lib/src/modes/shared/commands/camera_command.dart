import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/camera/camera_request.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:trip_application/trip_application.dart';

abstract class CameraCommand extends Command<Done> {
  const CameraCommand();
}

final class ZoomIn extends CameraCommand {
  const ZoomIn(this.position);
  final ScreenOffset position;
  @override
  Future<Done> handle(AppCommandScope scope) async {
    scope.director.submit(
      CameraRequest(ZoomAt(position), priority: CameraPriority.explicit),
    );
    return const Done();
  }
}

final class CameraBack extends CameraCommand {
  const CameraBack();
  @override
  Future<Done> handle(AppCommandScope scope) async {
    scope.director.back();
    return const Done();
  }
}

final class RequestCamera extends CameraCommand {
  const RequestCamera(this.request);
  final CameraRequest request;
  @override
  Future<Done> handle(AppCommandScope scope) async {
    scope.director.submit(request);
    return const Done();
  }
}

/// Cadre la caméra sur l'ensemble d'un voyage.
///
/// Commande partagée : c'est le cadrage de « j'ouvre ce voyage », d'où qu'il
/// vienne (clic sur la carte, voyage choisi dans un profil…). Elle est posée
/// par [TripMode.open] avec `focus: true`, qui l'enchaîne après le
/// chargement du voyage — avant, ses limites ne sont pas encore connues.
final class FocusTrip extends CameraCommand {
  const FocusTrip(this.tripId);
  final TripId tripId;

  @override
  Future<Done> handle(AppCommandScope scope) async {
    final bounds = scope.forTrip(tripId).route?.bounds;
    if (bounds != null) {
      scope.director.submit(
        CameraRequest(
          // Padding choisi automatiquement par le director.
          FitBounds(bounds),
          // Un choix de l'utilisateur : passe même s'il a bougé la carte.
          priority: CameraPriority.explicit,
        ),
      );
    }
    return const Done();
  }
}
