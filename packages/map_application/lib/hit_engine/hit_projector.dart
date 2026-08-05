// map_application/lib/hit_engine/hit_projector.dart
// AUCUNE dépendance flutter ni flutter_map

import 'dart:math';
import 'package:latlong2/latlong.dart';

/// Convertit une coordonnée géographique en point écran (pixels).
/// Fourni par la couche d'affichage (flutter_map aujourd'hui,
/// potentiellement autre chose demain).
typedef LatLngProjector = Point<double> Function(LatLng latLng);
