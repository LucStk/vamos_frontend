import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/waypoint_creator_dialog.dart';

void onMapTap(BuildContext context, LatLng latLng, int tripId) {
  // _mapNotifier.startWaypointCreation(latLng);
  WaypointCreatorDialog.show(
    context: context,
    tripId: tripId,
    vertexId: null,
    latLng: latLng,
  );
}
