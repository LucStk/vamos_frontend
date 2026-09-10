import 'package:latlong2/latlong.dart';

sealed class UserLocationState {
  const UserLocationState();
}

class UserPositionActive extends UserLocationState {
  final LatLng position;
  final double accuracy;
  final double heading;

  const UserPositionActive({
    required this.position,
    required this.accuracy,
    required this.heading,
  });
}

class UserPositionInactive extends UserLocationState {
  const UserPositionInactive();
}

class UserPositionUnavailable extends UserLocationState {
  const UserPositionUnavailable();
}

class UserPositionLoading extends UserLocationState {
  const UserPositionLoading();
}
