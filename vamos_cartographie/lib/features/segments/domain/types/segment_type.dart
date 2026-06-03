import 'package:vamos_cartographie/shared/shared.dart';
import "package:flutter/material.dart";

enum SegmentType implements MapItemType {
  bike,
  car,
  boat,
  walk,
  train;

  @override
  String get label => switch (this) {
    SegmentType.bike => 'Vélo',
    SegmentType.car => 'Voiture',
    SegmentType.boat => 'Bateau',
    SegmentType.walk => 'Marche',
    SegmentType.train => 'Train',
    _ => 'Autre',
  };
  @override
  IconData get icon => switch (this) {
    SegmentType.bike => Icons.directions_bike,
    SegmentType.car => Icons.directions_car,
    SegmentType.boat => Icons.directions_boat,
    SegmentType.walk => Icons.directions_walk,
    SegmentType.train => Icons.train,
    _ => Icons.help_outline,
  };
  @override
  Color get color => switch (this) {
    SegmentType.bike => Colors.blue,
    SegmentType.car => Colors.grey,
    SegmentType.boat => Colors.indigo,
    SegmentType.walk => Colors.green,
    SegmentType.train => Colors.red,
    _ => Colors.grey,
  };

  bool get isDashed => switch (this) {
    SegmentType.boat => true,
    SegmentType.train => true,
    _ => false,
  };
}
