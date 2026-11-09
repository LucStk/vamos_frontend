// modes/trip_editor/sketch/sketch_trace.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
part 'route_selection_slot.freezed.dart';

const routeSelectionSlot = Slot<RouteSelection>('routeSelection');

@freezed
abstract class RouteSelection with _$RouteSelection {
  const RouteSelection._();

  const factory RouteSelection({required double start, required double end}) =
      _RouteSelection;

  factory RouteSelection.collapsedAt(double pos) =>
      RouteSelection(start: pos, end: pos);

  /// Les poignées se bloquent l'une l'autre ; `project` gère déjà les bornes.
  RouteSelection withHandleAt(HandleSide side, double pos) => switch (side) {
    HandleSide.start => copyWith(start: pos),
    HandleSide.end => copyWith(end: pos),
  };
}
