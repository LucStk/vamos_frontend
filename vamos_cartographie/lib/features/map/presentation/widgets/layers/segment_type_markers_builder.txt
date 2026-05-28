import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

import "package:vamos_cartographie/features/segments/segments.dart";

class SegmentTypeMarkersBuilder {
  static List<Marker> buildMarkers(Trip trip, void Function(int) onTap) {
    final markers = <Marker>[];

    for (var i = 0; i < trip.segments.length; i++) {
      final segment = trip.segments[i];
      final points = trip.segmentPoints(i);

      // Placer le marqueur à côté du segment pour éviter les conflits et le mouvement
      if (points.length >= 2) {
        // Utiliser les waypoints principaux pour plus de stabilité
        final startWaypoint = i == 0 ? trip.waypoints[0] : trip.waypoints[i];
        final endWaypoint = trip.waypoints[i + 1];

        // Point à 1/3 entre les deux waypoints (plus stable)
        final basePoint = LatLng(
          startWaypoint.latLng.latitude +
              (endWaypoint.latLng.latitude - startWaypoint.latLng.latitude) / 3,
          startWaypoint.latLng.longitude +
              (endWaypoint.latLng.longitude - startWaypoint.latLng.longitude) /
                  3,
        );

        // Calculer la direction perpendiculaire pour le décalage
        final dx =
            endWaypoint.latLng.longitude - startWaypoint.latLng.longitude;
        final dy = endWaypoint.latLng.latitude - startWaypoint.latLng.latitude;
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

        markers.add(
          Marker(
            point: markerPoint,
            width: 20,
            height: 20,
            child: GestureDetector(
              onTap: () => onTap(i),
              child: Container(
                decoration: BoxDecoration(
                  color: segment.type.color.withOpacity(0.7),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                child: Icon(segment.type.icon, color: Colors.white, size: 12),
              ),
            ),
          ),
        );
      }
    }

    return markers;
  }
}
