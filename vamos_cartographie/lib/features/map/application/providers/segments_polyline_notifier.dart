// features/segments/presentation/providers/segments_notifier.dart
//
import 'dart:math' as math;
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import "segments_notifier.dart";
import "waypoints_notifier.dart";
part 'segments_polyline_notifier.g.dart';

@riverpod
List<LatLng>? segmentPolylinePoints(Ref ref, int tripId, int segmentId) {
  final segment = ref.watch(segmentProvider(tripId, segmentId));

  if (segment == null) return null;

  final start = ref.watch(
    waypointLatLngProvider(tripId, segment.startWaypointId),
  );

  final end = ref.watch(waypointLatLngProvider(tripId, segment.endWaypointId));

  if (start == null || end == null) return null;

  return [start, ...segment.intermediatePoints, end];
}

@riverpod
List<LatLng>? segmentTypePoints(Ref ref, int tripId, int segmentId) {
  final segment = ref.watch(segmentProvider(tripId, segmentId));

  if (segment == null) return null;

  final start = ref.watch(
    waypointLatLngProvider(tripId, segment.startWaypointId),
  );

  final end = ref.watch(waypointLatLngProvider(tripId, segment.endWaypointId));

  if (start == null || end == null) return null;
  // On calcule la position du point de légende du type.

  // Point à 1/3 entre les deux waypoints (plus stable)
  final basePoint = LatLng(
    start.latitude + (end.latitude - start.latitude) / 3,
    start.longitude + (end.longitude - start.longitude) / 3,
  );
  // Calculer la direction perpendiculaire pour le décalage
  final dx = end.longitude - start.longitude;
  final dy = end.latitude - start.latitude;
  final length = math.sqrt(dx * dx + dy * dy);
  // Vecteur perpendiculaire normalisé (rotation de 90 degrés)
  final perpX = -dy / length;
  final perpY = dx / length;

  // Décaler le marqueur perpendiculairement à la ligne
  // Le décalage est ajusté selon le zoom (environ 30 pixels à zoom 15)
  const offsetDistance = 0.0005; // En degrés, ajuster selon le besoin

  final markerPoint = LatLng(
    basePoint.latitude + perpY * offsetDistance,
    basePoint.longitude + perpX * offsetDistance,
  );

  return [markerPoint];
}
