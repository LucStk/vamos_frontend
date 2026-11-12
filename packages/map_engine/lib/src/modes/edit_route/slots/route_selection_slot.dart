// modes/trip_editor/sketch/sketch_trace.dart

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
part 'route_selection_slot.freezed.dart';

const routeSelectionSlot = Slot<RouteSelection>('routeSelection');

enum HandleId { a, b }

@freezed
abstract class RouteSelection with _$RouteSelection {
  const RouteSelection._();
  const factory RouteSelection({required double a, required double b}) =
      _RouteSelection;

  factory RouteSelection.collapsedAt(double pos) =>
      RouteSelection(a: pos, b: pos);

  // Tout ce qui consomme la sélection (surbrillance, conversion en spans)
  // continue de lire start / end.
  double get start => min(a, b);
  double get end => max(a, b);
  bool get isCollapsed => a == b;

  RouteSelection withHandleAt(HandleId id, double pos) => switch (id) {
    HandleId.a => copyWith(a: pos),
    HandleId.b => copyWith(b: pos),
  };
}
