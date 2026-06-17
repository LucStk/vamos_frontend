import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/presentation/states/states.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up_abstract.dart';
part "pop_up_provider.g.dart";

@riverpod
class MapPopupNotifier extends _$MapPopupNotifier {
  @override
  MapPopupState? build(Id<Trip> tripId) => null;

  void show({required LatLng latLng, required AbstractPopUp popUp}) {
    state = MapPopupState(latLng: latLng, popUp: popUp);
  }

  bool isOpen() {
    return (state != null);
  }

  void toggle({required LatLng latLng, required AbstractPopUp popUp}) {
    // Ouvre si fermé et ferme si ouvert
    if (isOpen()) {
      hide();
    } else {
      state = MapPopupState(latLng: latLng, popUp: popUp);
    }
  }

  void hide() {
    state = null;
  }
}
