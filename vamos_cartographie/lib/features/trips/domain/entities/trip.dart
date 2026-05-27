import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import "package:vamos_cartographie/features/media/domain/entities/media_image.dart";
// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------

class Trip {
  final int? id;
  final String title;
  final String description;
  final DateTime? date;
  final List<MediaImage> images;
  final List<Waypoint> waypoints;
  final List<Segment> segments;

  const Trip({
    this.id,
    this.title = '',
    this.description = '',
    this.date,
    this.images = const [],
    this.waypoints = const [],
    this.segments = const [],
  });

  Trip copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? date,
    List<MediaImage>? images,
    List<Waypoint>? waypoints,
    List<Segment>? segments,
  }) {
    return Trip(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      images: images ?? this.images,
      waypoints: waypoints ?? this.waypoints,
      segments: segments ?? this.segments,
    );
  }
}
