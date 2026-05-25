// Importe tes fichiers générés par Ferry en haut
import 'package:api_client/api_client.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class Segment {
  int? id;
  GSegmentTypeEnum type;
  List<LatLng> intermediatePoints;

  Segment({
    this.id,
    this.type = GSegmentTypeEnum.bike,
    List<LatLng>? intermediatePoints,
  }) : intermediatePoints = intermediatePoints ?? [];

  List<LatLng> allPoints(LatLng from, LatLng to) => [
    from,
    ...intermediatePoints,
    to,
  ];
}

extension SegmentTypeExtension on GSegmentTypeEnum {
  String get label => switch (this) {
    GSegmentTypeEnum.bike => 'Vélo',
    GSegmentTypeEnum.car => 'Voiture',
    GSegmentTypeEnum.boat => 'Bateau',
    GSegmentTypeEnum.walk => 'Marche',
    GSegmentTypeEnum.train => 'Train',
    _ => 'Autre',
  };
  IconData get icon => switch (this) {
    GSegmentTypeEnum.bike => Icons.directions_bike,
    GSegmentTypeEnum.car => Icons.directions_car,
    GSegmentTypeEnum.boat => Icons.directions_boat,
    GSegmentTypeEnum.walk => Icons.directions_walk,
    GSegmentTypeEnum.train => Icons.train,
    _ => Icons.help_outline,
  };
  Color get color => switch (this) {
    GSegmentTypeEnum.bike => Colors.blue,
    GSegmentTypeEnum.car => Colors.grey,
    GSegmentTypeEnum.boat => Colors.indigo,
    GSegmentTypeEnum.walk => Colors.green,
    GSegmentTypeEnum.train => Colors.red,
    _ => Colors.grey,
  };
  bool get isDashed => switch (this) {
    GSegmentTypeEnum.boat => true,
    GSegmentTypeEnum.train => true,
    _ => false,
  };
}
