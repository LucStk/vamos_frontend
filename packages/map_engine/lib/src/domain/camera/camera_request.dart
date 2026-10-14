import 'package:domain_core/map_geo_bounds.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';

enum CameraPriority { ambient, content, explicit } // l'index sert à comparer

sealed class CameraTarget {
  const CameraTarget();
}

final class FocusPoint extends CameraTarget {
  const FocusPoint(this.point, {this.zoom, this.minZoom = 0});
  final LatLng point;
  final double? zoom; // null = garder le zoom courant
  final double minZoom; // évite de dézoomer
}

final class FitBounds extends CameraTarget {
  const FitBounds(this.bounds, {this.padding = const MapEdgeInsets.all(48)});
  final MapLatLngBounds bounds;
  final MapEdgeInsets padding;
}

final class CameraRequest {
  const CameraRequest(this.target, {this.priority = CameraPriority.content});
  final CameraTarget target;
  final CameraPriority priority;
}

final class ZoomAt extends CameraTarget {
  const ZoomAt(this.point); // LatLng
  final ScreenOffset point;
}
