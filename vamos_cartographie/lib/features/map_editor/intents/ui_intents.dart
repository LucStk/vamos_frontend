part of 'intents.dart';
// Plus aucun import ici ! Ils sont hérités de intents.dart

class PutCursor extends MapIntents {
  // Changé en MapIntent (ou MapInteractionState si c'est vraiment voulu)
  final LatLng latLng;
  const PutCursor(this.latLng);
}
