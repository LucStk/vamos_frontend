import 'package:api_client/api_client.dart';
import 'package:latlong2/latlong.dart';
import "segment.dart";
import "trip_image.dart";
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------

class Trip {
  int? id;
  String title;
  String description;
  DateTime? date;
  List<TripImage> images;
  final List<Waypoint> waypoints;
  final List<Segment> segments;

  Trip({
    this.id,
    this.title = '',
    this.description = '',
    this.date,
    List<TripImage>? images,
    this.waypoints = const [],
    this.segments = const [],
  }) : images = images ?? [],
       assert(segments.length == waypoints.length - 1 || waypoints.isEmpty);

  void addWaypoint(
    LatLng latLng, {
    GWaypointEnum type = GWaypointEnum.WAYPOINT,
  }) {
    if (waypoints.isEmpty) {
      waypoints.add(Waypoint(latLng: latLng, type: GWaypointEnum.START));
    } else {
      waypoints.add(Waypoint(latLng: latLng, type: type));
      segments.add(Segment());
    }
    _updateEndpoints();
  }

  void removeWaypoint(int index) {
    if (waypoints.length <= 2) return;
    waypoints.removeAt(index);
    if (index == 0) {
      segments.removeAt(0);
    } else if (index >= segments.length) {
      segments.removeAt(segments.length - 1);
    } else {
      final merged = Segment(
        type: segments[index - 1].type,
        intermediatePoints: [
          ...segments[index - 1].intermediatePoints,
          ...segments[index].intermediatePoints,
        ],
      );
      segments.removeAt(index);
      segments.removeAt(index - 1);
      segments.insert(index - 1, merged);
    }
    _updateEndpoints();
  }

  void _updateEndpoints() {
    if (waypoints.isEmpty) return;
    if (waypoints.first.type == GWaypointEnum.END ||
        waypoints.first.type == GWaypointEnum.START) {
      waypoints.first.type = GWaypointEnum.START;
    }
    if (waypoints.last.type == GWaypointEnum.START ||
        waypoints.last.type == GWaypointEnum.END) {
      waypoints.last.type = GWaypointEnum.END;
    }
  }

  Trip copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    List<TripImage>? images,
  }) {
    return Trip(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      images: images ?? this.images,
      waypoints: waypoints,
      segments: segments,
    );
  }

  List<LatLng> segmentPoints(int segmentIndex) {
    return segments[segmentIndex].allPoints(
      waypoints[segmentIndex].latLng,
      waypoints[segmentIndex + 1].latLng,
    );
  }
}
