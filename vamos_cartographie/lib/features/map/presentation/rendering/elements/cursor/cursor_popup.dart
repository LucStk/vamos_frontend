import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class CursorPopUp extends StatelessWidget {
  final Id<Trip> tripId;
  final LatLng latLng;
  const CursorPopUp({super.key, required this.tripId, required this.latLng});

  @override
  Widget build(BuildContext context) {
    return PopUpShell(buttonsBuilder: (ctx) => []);
  }
}
