import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/src/route/domain/route.dart';
import 'package:trip_application/src/route/domain/route_section.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

class TripDetailsRes {
  final RouteRemoteModel route;
  final List<RouteSectionRemoteModel> section;
  final List<WaypointRemoteModel> waypoints;
  final List<(WaypointRemoteModel, List<StoredFileRemoteModel>)>
  waypointsImages;
  TripDetailsRes({
    required this.route,
    required this.waypoints,
    required this.section,
    required this.waypointsImages,
  });
}

class CreateRoutePayload {
  final RouteSectionRemoteModel section;
  final bool rafinementFailed;
  final String? errorMessage;
  CreateRoutePayload({
    required this.section,
    required this.rafinementFailed,
    this.errorMessage,
  });
}

class RefineSegmentPayload {
  final RouteSectionFields segment;
  final bool rafinementFailed;
  final String? errorMessage;
  RefineSegmentPayload({
    required this.segment,
    required this.rafinementFailed,
    this.errorMessage,
  });
}
