import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/topology/orchestrators/vertex_orchestrator.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/waypoint_creator_dialog.dart';

void onMapTap(BuildContext context, LatLng latLng, Id<Trip> tripId) {
  // _mapNotifier.startWaypointCreation(latLng);
  WaypointCreatorDialog.show(
    context: context,
    tripId: tripId,
    vertexId: null,
    latLng: latLng,
  );
}
