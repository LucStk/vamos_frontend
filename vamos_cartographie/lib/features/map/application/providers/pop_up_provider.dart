import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/application/states/states.dart';
part "pop_up_provider.g.dart";

@riverpod
class MapPopupNotifier extends _$MapPopupNotifier {
  @override
  MapPopupState? build(Id<Trip> tripId) => null;

  void show({required LatLng latLng, required PopMenu popMenu}) {
    state = MapPopupState(latLng: latLng, popMenu: popMenu);
  }

  void hide() {
    state = null;
  }
}
