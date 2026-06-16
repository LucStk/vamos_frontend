import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/waypoints/presentation/dialogs/create_waypoint_dialog.dart';

void onMapTap(BuildContext context, LatLng latLng, Id<Trip> tripId) {
  // _mapNotifier.startWaypointCreation(latLng);
  CreateWaypointDialog.show(
    context: context,
    tripId: tripId,
    vertexId: null,
    latLng: latLng,
  );
}
