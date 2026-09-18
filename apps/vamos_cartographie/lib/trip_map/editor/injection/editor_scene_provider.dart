import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:trip_application/waypoint/waypoint.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/topology/injection/injection.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_queries.dart';

import 'package:vamos_cartographie/base_map/base_map.dart';
part 'editor_scene_provider.g.dart';

// final projection = const Epsg3857().projection;

@Riverpod(keepAlive: true)
ProjectedScene editorProjectedScene(Ref ref, TripId tripId) {
  final objects = <ProjectedObject>[
    if (sketchSegment case final segment?) segment,
    if (sketchPencil case final pencil?) pencil,
    if (userLocation case final location?) location,
  ];
  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return ProjectedScene(objects);
}

@riverpod
ProjectedLine? projectSketchSegment(Ref ref, TripId tripId) {
  final editorState = ref.watch(tripMapStateProvider(tripId));

  final cameraReader = ref.read(mapCameraReaderProvider);
  if (editorState case final SketchMode sketch) {
    return ProjectedSketchSegment(
      object: MapSketchSegment(sketch.path),
      worldPoints: sketch.path
          .map((p) => cameraReader.latLngToWorldOffset(p))
          .toList(),
    );
  }
  return null;
}

@riverpod
ProjectedPoint? projectSketchPencil(Ref ref, TripId tripId) {
  final editorState = ref.watch(tripMapStateProvider(tripId));

  final cameraReader = ref.read(mapCameraReaderProvider);
  if (editorState case final SketchMode sketch) {
    final position = sketch.pencilPositionOrNull;
    if (position != null) {
      return ProjectedSketchPencil(
        object: MapSketchPencil(position),
        worldPosition: cameraReader.latLngToWorldOffset(position),
      );
    }
  }
  return null;
}
