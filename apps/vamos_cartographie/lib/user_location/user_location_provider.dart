import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_provider.g.dart';

enum UserLocationStatus { inactive, active, unavailable }

class UserLocationState {
  const UserLocationState({
    required this.status,
    this.position,
    this.accuracy,
    this.heading,
  });

  const UserLocationState.inactive()
    : status = UserLocationStatus.inactive,
      position = null,
      accuracy = null,
      heading = null;

  const UserLocationState.unavailable()
    : status = UserLocationStatus.unavailable,
      position = null,
      accuracy = null,
      heading = null;

  final UserLocationStatus status;

  final LatLng? position;
  final double? accuracy;
  final double? heading;

  bool get isActive => status == UserLocationStatus.active;
  bool get isInactive => status == UserLocationStatus.inactive;
  bool get isUnavailable => status == UserLocationStatus.unavailable;
}

@riverpod
class UserLocationNotifier extends _$UserLocationNotifier {
  StreamSubscription<Position>? _subscription;

  @override
  UserLocationState build() {
    ref.onDispose(() {
      _subscription?.cancel();
    });

    return const UserLocationState.inactive();
  }

  Future<void> start() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      state = const UserLocationState.unavailable();
      return;
    }

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      state = const UserLocationState.unavailable();
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

      state = const UserLocationState.unavailable();
    }
  }

  void _update(Position position) {
    state = UserLocationState(
      status: UserLocationStatus.active,
      position: LatLng(position.latitude, position.longitude),
      accuracy: position.accuracy,
      heading: position.heading,
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;

    state = const UserLocationState.inactive();
  }
}
