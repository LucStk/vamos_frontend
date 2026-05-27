import "package:vamos_cartographie/features/segments/domain/entities/segment.dart";
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import "package:vamos_cartographie/features/media/domain/entities/entities.dart";
// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    int? id,
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
    @Default([]) List<MediaImage> images,
    @Default([]) List<Waypoint> waypoints,
    @Default([]) List<Segment> segments,
  }) = _Trip;
}
