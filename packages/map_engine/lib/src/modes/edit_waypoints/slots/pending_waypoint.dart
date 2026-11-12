import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'pending_waypoint.freezed.dart';

const pendingWaypointSlot = Slot<PendingWaypoint>('pendingWaypointSlot');

/// Waypoint posé par l'utilisateur, pas encore confirmé : rien n'est envoyé
/// au serveur avant la confirmation.

@freezed
abstract class PendingWaypoint with _$PendingWaypoint {
  const PendingWaypoint._();

  const factory PendingWaypoint({required MapHit hit}) = _PendingWaypoint;

  WorldOffset get point => hit.point;

  /// Position sur la polyline, si le waypoint est posé sur la route.
  double? get routePosition => switch (hit) {
    HitObject(
      object: MapMobilitySpan(),
      detail: RouteHitDetail(:final position),
    ) =>
      position,
    _ => null,
  };
}
