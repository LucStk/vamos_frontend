import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

part 'route_day.freezed.dart';

/// Une journée de déplacement : le trajet entre deux haltes consécutives (ou
/// entre le départ, ou l'arrivée, et la halte la plus proche).
///
/// Dérivée, jamais stockée : elle est recalculée à partir des haltes des
/// waypoints (`WaypointFields.stay`), donc elle suit les modifications
/// optimistes des waypoints sans passer par le serveur.
///
/// Les jours passés sur place (offsets 1..n-1 d'une halte) n'ont pas de
/// géométrie : ils ne sont pas des `RouteDay`, seulement des `DayNote`.
@freezed
abstract class RouteDay with _$RouteDay {
  const RouteDay._();

  const factory RouteDay({
    /// Numéro dans le calendrier, jours sur place compris (1, 4, 5…).
    required int number,

    /// Positions sur la polyline, même repère que `anchorPosition`.
    required double from,
    required double to,

    /// Waypoint de halte qui termine cette journée. Null : dernière journée
    /// (celle qui finit à l'arrivée). Sert d'identité : le numéro change dès
    /// qu'on modifie un nombre de nuits, pas la halte.
    WaypointId? endsAt,
  }) = _RouteDay;

  /// Faux quand deux haltes (ou une halte et une extrémité) sont au même
  /// endroit : rien à dessiner.
  bool get hasGeometry => to > from;
}
