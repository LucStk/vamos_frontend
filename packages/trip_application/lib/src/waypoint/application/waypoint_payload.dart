import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';

class WaypointPayload {
  final WaypointRemoteModel waypoint;
  final Iterable<StoredFileRemoteModel> images;
  WaypointPayload({required this.waypoint, required this.images});
}
