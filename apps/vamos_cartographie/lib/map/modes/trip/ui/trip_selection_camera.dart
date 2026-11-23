import 'dart:math';

import 'package:domain_core/domain_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/modes/shared/helpers/section_slice.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog.dart';

/// Marge laissée autour de ce qu'on cadre, en pixels.
const _margin = 24.0;

/// Étendue minimale d'un cadrage, en degrés (environ 400 m) : un jour presque
/// droit ne zoome pas à l'infini.
const _minSpan = 0.004;

/// Les marges de cadrage quand un dialog à hauteur partielle est ouvert : la
/// carte n'est visible qu'au-dessus de lui, c'est là qu'on cadre.
MapEdgeInsets selectionFramePadding(BuildContext context) {
  final media = MediaQuery.of(context);
  final height = media.size.height;
  // Même calcul que [InfoDialog] : la place qui reste entre la zone sûre, la
  // marge du haut et le dock.
  final available =
      height - media.padding.vertical - 12 - TripReadyDock.clearance;
  final covered =
      media.padding.bottom +
      TripReadyDock.clearance +
      available * kPartialDialogHeightFactor;
  return MapEdgeInsets.only(
    left: 40,
    right: 40,
    top: media.padding.top + _margin,
    bottom: min(covered + _margin, height * 0.7),
  );
}

/// Cadre la caméra sur [selected] : la portion de route d'un jour ou d'un
/// morceau ; pour un waypoint, elle le centre sans changer le zoom. Sans effet
/// pour le reste.
void frameSelection(
  WidgetRef ref,
  TripId tripId,
  MapObject? selected, {
  required MapEdgeInsets padding,
}) {
  final target = switch (selected) {
    MapDaySegment(:final endsAt) => _fit(
      _dayBounds(ref, tripId, endsAt),
      padding,
    ),
    MapDayRun(:final endsAt, :final spanId) => _fit(
      _runBounds(ref, tripId, endsAt, spanId),
      padding,
    ),
    MapWaypoint(:final id) => _center(ref, tripId, id, padding),
    _ => null,
  };
  if (target == null) return;

  ref
      .read(cameraDirectorProvider)
      // Un choix de l'utilisateur : passe même après qu'il a bougé la carte.
      .submit(CameraRequest(target, priority: CameraPriority.explicit));
}

CameraTarget? _fit(MapLatLngBounds? bounds, MapEdgeInsets padding) =>
    bounds == null ? null : FitBounds(bounds, padding: padding);

/// Centre le waypoint au milieu de la partie de la carte que le dialog laisse
/// libre (et non au milieu de l'écran, qu'il recouvre à moitié), sans toucher
/// au zoom.
CameraTarget _center(
  WidgetRef ref,
  TripId tripId,
  WaypointId id,
  MapEdgeInsets padding,
) {
  final position = ref.read(waypointProvider(tripId, id)).position;
  final camera = ref.read(mapCameraProvider);

  // Le waypoint doit finir à `dy` pixels au-dessus du centre de l'écran. Ce
  // décalage, vu depuis la carte (rotation comprise), est le vecteur monde
  // entre le centre de l'écran et le point `dy` plus bas ; on l'ajoute au
  // waypoint pour obtenir le centre à viser.
  final dy = (padding.bottom - padding.top) / 2;
  final center = camera.screenCenter;
  final shift =
      camera.screenToWorld(ScreenOffset(center.value + Offset(0, dy))) -
      camera.screenToWorld(center);
  final target = camera.worldOffsetToLatLng(
    camera.latLngToWorldOffset(position) + shift,
  );
  return PanTo(target);
}

List<LatLng>? _geometry(WidgetRef ref, TripId tripId) =>
    ref.read(routeStoreProvider(tripId)).route?.current.geometry;

MapLatLngBounds? _dayBounds(WidgetRef ref, TripId tripId, WaypointId? endsAt) {
  final day = ref.read(routeDayProvider(tripId, endsAt));
  final geometry = _geometry(ref, tripId);
  if (day == null || geometry == null) return null;
  return _boundsOf(sliceBetweenPositions(geometry, day.from, day.to));
}

MapLatLngBounds? _runBounds(
  WidgetRef ref,
  TripId tripId,
  WaypointId? endsAt,
  SpanId spanId,
) {
  final geometry = _geometry(ref, tripId);
  final run = ref
      .read(dayRunsProvider(tripId, endsAt))
      ?.runs
      .where((r) => r.mobilityId == spanId)
      .firstOrNull;
  if (run == null || geometry == null) return null;
  return _boundsOf(
    sliceBetweenPositions(geometry, run.range.from, run.range.to),
  );
}

MapLatLngBounds? _boundsOf(List<LatLng>? points) {
  if (points == null || points.isEmpty) return null;
  final b = MapLatLngBounds.fromPoints(points);
  // Étendue minimale, centrée sur les points.
  final lat = max(b.north - b.south, _minSpan);
  final lng = max(b.east - b.west, _minSpan);
  final center = b.center;
  return MapLatLngBounds(
    north: center.latitude + lat / 2,
    south: center.latitude - lat / 2,
    east: center.longitude + lng / 2,
    west: center.longitude - lng / 2,
  );
}
