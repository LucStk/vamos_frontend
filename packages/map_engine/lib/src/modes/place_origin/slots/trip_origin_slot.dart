import 'package:domain_core/space/offset_type.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

/// Nommé Trace pour ne pas se confondre avec MapSketchSegment (l'objet de la carte).
final class TripOrigin {
  const TripOrigin(this.point);
  final WorldOffset point; // jamais modifiée après construction
}

const tripOriginSlot = Slot<TripOrigin>('tripOrigin');
