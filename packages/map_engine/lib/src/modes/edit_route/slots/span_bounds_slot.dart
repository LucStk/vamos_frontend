// modes/edit_route/slots/span_bounds_slot.dart
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

part 'span_bounds_slot.freezed.dart';

const spanBoundsSlot = Slot<SpanBounds>('spanBoundsSlot');

/// Une des deux bornes du span sélectionné.
enum SpanBound { start, end }

/// Bornes du span sélectionné pendant leur ajustement, en positions sur la
/// polyline (même repère que `RouteHitDetail.position`).
///
/// Brouillon local : rien n'est envoyé au serveur avant la validation.
/// Déplacer [end] déplace aussi le début du span suivant.
@freezed
abstract class SpanBounds with _$SpanBounds {
  const SpanBounds._();

  const factory SpanBounds({required double start, required double end}) =
      _SpanBounds;

  SpanBounds withBoundAt(SpanBound bound, double position) => switch (bound) {
    SpanBound.start => copyWith(start: position),
    SpanBound.end => copyWith(end: position),
  };
  double operator [](SpanBound bound) => switch (bound) {
    SpanBound.start => start,
    SpanBound.end => end,
  };
  // span_bounds_slot.dart, avec import 'dart:math';
  double get lower => min(start, end);
  double get upper => max(start, end);
}
