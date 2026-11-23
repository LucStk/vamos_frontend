import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/segment/providers/segments_layer.dart';

/// Jour sélectionné de ce trip, en entier ou par l'un de ses morceaux.
/// Record comparé par valeur ; null : aucun jour.
({WaypointId? endsAt})? _selectedDay(Ref ref, TripId tripId) => ref.watch(
  modeSelectionProvider.select(
    (s) => switch (s) {
      MapDaySegment(tripId: final t, endsAt: final day) ||
      MapDayRun(tripId: final t, endsAt: final day) when t == tripId => (
        endsAt: day,
      ),
      _ => null,
    },
  ),
);

/// Quand un jour est sélectionné, tout ce qui est hors de ce jour devient
/// transparent : les autres jours, leurs étapes et leurs badges de mobilité.
///
/// Un waypoint sur la borne d'un jour (une halte) appartient aux deux jours
/// qu'elle sépare : il reste visible.
Map<Object, Set<VisualTrait>> dimOutsideSelectedDay(
  Ref ref,
  TripId tripId,
  MapCameraReader cam,
) {
  final selected = _selectedDay(ref, tripId);
  if (selected == null) return const {};

  final day = ref.watch(routeDayProvider(tripId, selected.endsAt));
  if (day == null) return const {};

  bool inside(double position) => position >= day.from && position <= day.to;

  const dimmed = {VisualTrait.dimmed};
  final out = <Object, Set<VisualTrait>>{};

  for (final d in ref.watch(routeDaysProvider(tripId))) {
    if (d.endsAt != selected.endsAt) {
      out[MapDaySegment(tripId: tripId, endsAt: d.endsAt)] = dimmed;
    }
  }

  for (final id in ref.watch(allWaypointIdsProvider(tripId))) {
    final anchor = ref.watch(
      waypointProvider(tripId, id).select((w) => w.anchorPosition),
    );
    if (!inside(anchor)) out[MapWaypoint(tripId: tripId, id: id)] = dimmed;
  }

  final polyline = ref.watch(routePolylineProvider(tripId, cam));
  if (polyline != null) {
    for (final item in ref.watch(allMobilityBadgeItemProvider(tripId, cam))) {
      if (item is! PointItem) continue;
      if (!inside(polyline.project(item.worldPosition))) {
        out[item.object] = dimmed;
      }
    }
  }
  return out;
}
