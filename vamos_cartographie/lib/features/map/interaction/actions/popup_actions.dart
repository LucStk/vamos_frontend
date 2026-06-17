import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/interaction/interation.dart';
import 'package:vamos_cartographie/features/map/interaction/state/pop_up.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up_abstract.dart';

MapInteractionState showPopup(
  MapInteractionState state,
  LatLng pos,
  AbstractPopUp popUp,
) {
  return state.copyWith(
    popup: MapPopupState(latLng: pos, popUp: popUp),
  );
}

MapInteractionState hidePopup(MapInteractionState state) {
  return state.copyWith(popup: null);
}
