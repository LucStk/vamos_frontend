import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_edition_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/sketch_tool_mode.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';

final class SketchGenerating extends SketchToolMode {
  SketchGenerating(super.tripId, this.editing) : token = Object();

  final SketchEdition editing; // le mode d'où l'on vient
  final Object token; // identifie la requête en cours

  @override
  Set<Slot> get retainedSlots => {sketchTraceSlot}; // la trace reste affichée

  // Gestes inertes. Surcharge `onTap` si `TripMode` sort vers Explore,
  // comme tu l'as fait dans `TripValidatingMode`.
  @override
  Transition onTap(TapGesture g) => Transition.stay();
}
