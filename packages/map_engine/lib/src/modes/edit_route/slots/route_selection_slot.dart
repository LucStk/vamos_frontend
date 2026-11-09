// modes/trip_editor/sketch/sketch_trace.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
part 'route_selection_slot.freezed.dart';

const routeSelectionSlot = Slot<RouteSelection>('routeSelection');

/// Tracé à main levée en cours de saisie, destiné à `editRoute`.
///
/// - [startPoint] : position initiale du crayon, toujours présente.
/// - [startAnchor] : ancre de départ éventuelle.
/// - [endAnchor] : ancre d'arrivée éventuelle.
/// - [points] : points dessinés, dans l'ordre, sans les ancres.
/// - [mobilityType] : `null` signifie hériter de la section raccordée,
///   en priorité celle de départ, puis celle d'arrivée.
///   Pour la première route du trajet, la mobilité est obligatoire.

@freezed
abstract class RouteSelection with _$RouteSelection {
  const RouteSelection._();

  const factory RouteSelection({
    required int startIndex,
    required int endIndex,
  }) = _RouteSelection;

  factory RouteSelection.collapsedAt(int index) =>
      RouteSelection(startIndex: index, endIndex: index);

  /// Déplace une poignée. Si elle dépasse l'autre, elle s'arrête dessus.
  RouteSelection withHandleAt(HandleSide side, int index) => switch (side) {
    HandleSide.start => copyWith(startIndex: index.clamp(0, endIndex)),
    HandleSide.end => copyWith(
      endIndex: index.clamp(startIndex, double.maxFinite.toInt()),
    ),
  };
}
