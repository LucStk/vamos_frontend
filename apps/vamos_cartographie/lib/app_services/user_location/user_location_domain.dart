import 'package:latlong2/latlong.dart';

sealed class UserLocationState {
  const UserLocationState();
}

final class UserPositionInactive extends UserLocationState {
  const UserPositionInactive();
}

final class UserPositionLoading extends UserLocationState {
  const UserPositionLoading();
}

final class UserPositionActive extends UserLocationState {
  const UserPositionActive({
    required this.position,
    required this.accuracy,
    required this.heading,
  });

  final LatLng position;
  final double accuracy;
  final double heading;
}

final class UserPositionUnavailable extends UserLocationState {
  const UserPositionUnavailable();
}
