import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_engine/map_engine.dart';

extension MapEdgeInsetsToFlutter on MapEdgeInsets {
  EdgeInsets toFlutter() {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}

extension FlutterEdgeInsetsToMap on EdgeInsets {
  MapEdgeInsets toMapEngine() {
    return MapEdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }
}

extension MapLatLngBoundsToFlutter on MapLatLngBounds {
  LatLngBounds toFlutterMap() {
    return LatLngBounds(southWest, northEast);
  }
}

extension FlutterLatLngBoundsToMap on LatLngBounds {
  MapLatLngBounds toMapEngine() {
    return MapLatLngBounds(north: north, south: south, east: east, west: west);
  }
}
