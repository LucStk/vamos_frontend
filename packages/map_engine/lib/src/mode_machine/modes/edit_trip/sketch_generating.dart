import 'package:map_engine/src/domain/gestures/map_gesture.dart';
import 'package:map_engine/src/mode_machine/modes/app_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/sketch_edition_mode.dart';
import 'package:map_engine/src/mode_machine/modes/edit_trip/trip_edit_mode.dart';
import 'package:map_engine/src/mode_machine/slots/sketch_trace_slot.dart';
import 'package:map_engine/src/mode_machine/slots/slot.dart';
import 'package:map_engine/src/mode_machine/transition.dart';

final class SketchGenerating extends TripEditableMode {
  SketchGenerating(super.tripId, this.editing) : token = Object();

  final SketchEdition editing; // le mode d'où l'on vient
  final Object token; // identifie la requête en cours

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot}; // la trace reste affichée

  // Gestes inertes. Surcharge `onTap` si `TripMode` sort vers Explore,
  // comme tu l'as fait dans `TripValidatingMode`.
  @override
  Transition<AppMode> onTap(TapGesture g) => Transition.stay();
}
