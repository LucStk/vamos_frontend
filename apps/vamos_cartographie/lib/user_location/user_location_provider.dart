import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_provider.g.dart';

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

@riverpod
class UserLocationNotifier extends _$UserLocationNotifier {
  StreamSubscription<Position>? _subscription;

  @override
  UserLocationState build() {
    ref.onDispose(() {
      _subscription?.cancel();
    });

    return const UserPositionInactive();
  }

  Future<void> start() async {
    state = const UserPositionLoading();

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      state = const UserPositionUnavailable();
      return;
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      state = const UserPositionUnavailable();
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition();

      _update(position);

      await _subscription?.cancel();

      _subscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 5,
        ),
      ).listen(_update);
    } catch (error) {
      debugPrint('Unable to get user location: $error');

      state = const UserPositionUnavailable();
    }
  }

  void _update(Position position) {
    state = UserPositionActive(
      position: LatLng(position.latitude, position.longitude),
      accuracy: position.accuracy,
      heading: position.heading,
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;

    state = const UserPositionInactive();
  }
}
