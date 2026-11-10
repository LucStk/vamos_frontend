// modes/trip_editor/sketch/sketch_trace.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
part 'span_selection_slot.freezed.dart';

const spanSelectionSlot = Slot<SpanSelectionSlot>('spanSelectionSlot');

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
abstract class SpanSelectionSlot with _$SpanSelectionSlot {
  const SpanSelectionSlot._();

  const factory SpanSelectionSlot({required int currentIndex}) =
      _SpanSelectionSlot;
}
