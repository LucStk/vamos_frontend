import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/user_location/user_location_domain.dart';

part 'user_location_provider.g.dart';

@riverpod
class UserLocationNotifier extends _$UserLocationNotifier {
  StreamSubscription<Position>? _subscription;

  @override
  UserLocation? build() {
    ref.onDispose(() {
      _subscription?.cancel();
    });

    return null;
  }

  Future<void> start() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedException("Location access Denied");
    }

    final position = await Geolocator.getCurrentPosition();

    _update(position);

    await _subscription?.cancel();

    _subscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen(_update);
  }

  void _update(Position position) {
    state = UserLocation(
      position: LatLng(position.latitude, position.longitude),
      accuracy: position.accuracy,
      heading: position.heading,
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
