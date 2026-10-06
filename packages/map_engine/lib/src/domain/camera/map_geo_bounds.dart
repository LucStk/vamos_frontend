// dans map_engine/domain/map_geo_bounds.dart

import 'package:latlong2/latlong.dart';

/// Représentation agnostique de bornes géographiques (Sud-Ouest et Nord-Est).

final class MapLatLngBounds {
  final double north;
  final double south;
  final double east;
  final double west;

  const MapLatLngBounds({
    required this.north,
    required this.south,
    required this.east,
    required this.west,
  });

  factory MapLatLngBounds.fromPoints(Iterable<LatLng> points) {
    final iterator = points.iterator;

    if (!iterator.moveNext()) {
      throw ArgumentError('Cannot create bounds from empty points');
    }

    var north = iterator.current.latitude;
    var south = north;
    var east = iterator.current.longitude;
    var west = east;

    while (iterator.moveNext()) {
      final point = iterator.current;

      if (point.latitude > north) north = point.latitude;
      if (point.latitude < south) south = point.latitude;
      if (point.longitude > east) east = point.longitude;
      if (point.longitude < west) west = point.longitude;
    }

    return MapLatLngBounds(north: north, south: south, east: east, west: west);
  }

  LatLng get northWest => LatLng(north, west);
  LatLng get northEast => LatLng(north, east);
  LatLng get southWest => LatLng(south, west);
  LatLng get southEast => LatLng(south, east);

  LatLng get center => LatLng((north + south) / 2, (east + west) / 2);
}

/// Représentation agnostique du padding en pixels logiques.
class MapEdgeInsets {
  const MapEdgeInsets.all(double value)
    : left = value,
      top = value,
      right = value,
      bottom = value;

  const MapEdgeInsets.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : left = horizontal,
       top = vertical,
       right = horizontal,
       bottom = vertical;

  const MapEdgeInsets.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
  });

  static const zero = MapEdgeInsets.all(0.0);

  final double left;
  final double top;
  final double right;
  final double bottom;
}
