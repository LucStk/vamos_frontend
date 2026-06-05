import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waypoint.freezed.dart';

@freezed
abstract class Waypoint with _$Waypoint {
  const Waypoint._();
  const factory Waypoint({
    required int id,
    @Default('') String title,
    @Default(WaypointType.waypoint) WaypointType type,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _Waypoint;
  WaypointDraft toDraft() {
    return WaypointDraft(
      title: title,
      type: type,
      description: description,
      images: images,
    );
  }
}

@freezed
abstract class WaypointDraft with _$WaypointDraft {
  const WaypointDraft._();
  const factory WaypointDraft({
    @Default('') String title,
    @Default(WaypointType.waypoint) WaypointType type,
    @Default('') String description,
    @Default([]) List<MediaImage> images,
  }) = _WaypointDraft;

  Waypoint toWaypoint(int id) {
    return Waypoint(
      id: id,
      title: title,
      type: type,
      description: description,
      images: images,
    );
  }
}

// Utilise les extensions définit dans le schema pour obtenir le label et l'icône correspondant à chaque type de point de passage

// void addWaypoint(
//   LatLng latLng, {
//   GWaypointEnum type = GWaypointEnum.WAYPOINT,
// }) {
//   if (waypoints.isEmpty) {
//     waypoints.add(Waypoint(latLng: latLng, type: GWaypointEnum.START));
//   } else {
//     waypoints.add(Waypoint(latLng: latLng, type: type));
//     segments.add(Segment());
//   }
//   _updateEndpoints();
// }

// void removeWaypoint(int index) {
//   if (waypoints.length <= 2) return;
//   waypoints.removeAt(index);
//   if (index == 0) {
//     segments.removeAt(0);
//   } else if (index >= segments.length) {
//     segments.removeAt(segments.length - 1);
//   } else {
//     final merged = Segment(
//       type: segments[index - 1].type,
//       geometry: [
//         ...segments[index - 1].geometry,
//         ...segments[index].geometry,
//       ],
//     );
//     segments.removeAt(index);
//     segments.removeAt(index - 1);
//     segments.insert(index - 1, merged);
//   }
//   _updateEndpoints();
// }

// void _updateEndpoints() {
//   if (waypoints.isEmpty) return;
//   if (waypoints.first.type == GWaypointEnum.END ||
//       waypoints.first.type == GWaypointEnum.START) {
//     waypoints.first.type = GWaypointEnum.START;
//   }
//   if (waypoints.last.type == GWaypointEnum.START ||
//       waypoints.last.type == GWaypointEnum.END) {
//     waypoints.last.type = GWaypointEnum.END;
//   }
// }

// List<LatLng> segmentPoints(int segmentIndex) {
//   return segments[segmentIndex].allPoints(
//     waypoints[segmentIndex].latLng,
//     waypoints[segmentIndex + 1].latLng,
//   );
// }
