// features/map/presentation/providers/map_notifier.dart
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import "package:vamos_cartographie/features/map/presentation/states/states.dart";
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

part 'cursor_provider.g.dart';

@riverpod
class MapCursorNotifier extends _$MapCursorNotifier {
  @override
  MapCursorState build(Id<Trip> tripId) {
    return const MapCursorState(); // État initial de Freezed
  }

  LatLng getPosition() => state.latLng;
  void setPosition(LatLng latLng) {
    state = state.copyWith(latLng: latLng, popUpOpen: true);
  }

  void hidePopUp() {
    state = state.copyWith(popUpOpen: false);
  }

  void close() {
    state = state.copyWith(isOpen: false, popUpOpen: false);
  }

  void open() => state = state.copyWith(isOpen: true);
}
