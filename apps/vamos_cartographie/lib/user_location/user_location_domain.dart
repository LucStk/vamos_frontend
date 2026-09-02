import 'package:latlong2/latlong.dart';

class UserLocation {
  const UserLocation({required this.position, this.accuracy, this.heading});

  final LatLng position;
  final double? accuracy;
  final double? heading;
}
