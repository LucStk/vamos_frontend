import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';

sealed class DomainCommand {}

class CreateWaypointCommand extends DomainCommand {
  final WaypointDraft draft;
  final int? vertexId;
  final LatLng? latLng;

  CreateWaypointCommand({required this.draft, this.vertexId, this.latLng});
}
