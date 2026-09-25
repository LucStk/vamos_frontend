import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_location_domain.dart';

part 'user_location_provider.g.dart';

@Riverpod(keepAlive: true)
class UserLocationNotifier extends _$UserLocationNotifier {
  StreamSubscription<Position>? _subscription;

  /// Identifie la dernière opération start/stop.
  ///
  /// Permet d'ignorer le résultat d'une opération asynchrone devenue
  /// obsolète, par exemple un getCurrentPosition() qui termine après stop().
  int _generation = 0;

  @override
  UserLocationState build() {
    ref.onDispose(() {
      _generation++;
      _subscription?.cancel();
    });

    return const UserPositionInactive();
  }

  Future<void> start() async {
    final generation = ++_generation;

    // start() est idempotent : on ne conserve jamais plusieurs streams.
    await _subscription?.cancel();
    _subscription = null;

    if (!_isCurrent(generation)) return;

    state = const UserPositionLoading();

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!_isCurrent(generation)) return;

      if (!serviceEnabled) {
        state = const UserPositionUnavailable();
        return;
      }

      var permission = await Geolocator.checkPermission();

      if (!_isCurrent(generation)) return;

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (!_isCurrent(generation)) return;

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        state = const UserPositionUnavailable();
        return;
      }

      // On veut une première position avant de passer à Active.
      final position = await Geolocator.getCurrentPosition();

      if (!_isCurrent(generation)) return;

      _update(position);

      _subscription =
          Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 5,
            ),
          ).listen(
            (position) {
              if (_isCurrent(generation)) {
                _update(position);
              }
            },
            onError: (Object error, StackTrace stackTrace) {
              // Une erreur du stream est considérée comme transitoire.
              //
              // On ne passe PAS à Unavailable : la localisation peut continuer
              // à fonctionner lors du prochain événement.
              debugPrint('User location stream error: $error');
              debugPrintStack(stackTrace: stackTrace);
            },
          );
    } catch (error, stackTrace) {
      debugPrint('Unable to get user location: $error');
      debugPrintStack(stackTrace: stackTrace);

      if (_isCurrent(generation)) {
        state = const UserPositionUnavailable();
      }
    }
  }

  Future<void> stop() async {
    ++_generation;

    await _subscription?.cancel();
    _subscription = null;

    state = const UserPositionInactive();
  }

  bool _isCurrent(int generation) {
    return generation == _generation;
  }

  void _update(Position position) {
    state = UserPositionActive(
      position: LatLng(position.latitude, position.longitude),
      accuracy: position.accuracy,
      heading: position.heading,
    );
  }
}
