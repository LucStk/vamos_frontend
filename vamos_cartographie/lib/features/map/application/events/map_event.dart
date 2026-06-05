import 'package:freezed_annotation/freezed_annotation.dart';
part 'map_event.freezed.dart';

@freezed
sealed class MapEvent with _$MapEvent {
  const factory MapEvent.openWaypointDialog({required int waypointId}) =
      OpenWaypointDialog;

  const factory MapEvent.openWaypointEditor({required int waypointId}) =
      OpenWaypointEditor;
}
