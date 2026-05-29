// features/map/presentation/providers/map_state_provider.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
part 'map_interaction_state.freezed.dart';

@freezed
sealed class MapInteraction with _$MapInteraction {
  const factory MapInteraction.none() = NoMapInteraction;

  const factory MapInteraction.creatingWaypoint({
    required LatLng position,
    @Default(false) bool isDragging,
  }) = CreatingWaypointInteraction;

  const factory MapInteraction.creatingSegment({
    required LatLng start,
    LatLng? current,
  }) = CreatingSegmentInteraction;
}
