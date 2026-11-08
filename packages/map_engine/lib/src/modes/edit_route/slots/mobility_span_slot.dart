// modes/trip_editor/sketch/sketch_trace.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
import 'package:trip_application/trip_application.dart';
part 'mobility_span_slot.freezed.dart';

const mobilitySpanSlot = Slot<MobilitySpanSelected>('mobilitySpanSelected');

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
abstract class MobilitySpanSelected with _$MobilitySpanSelected {
  const MobilitySpanSelected._();

  const factory MobilitySpanSelected({
    required MobilitySpanId mobilitySpanId,
    required int currentIndex,
  }) = _MobilitySpanSelected;
}
