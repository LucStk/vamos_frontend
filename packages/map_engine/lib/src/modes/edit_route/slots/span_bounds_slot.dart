// modes/edit_route/slots/span_bounds_slot.dart
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

part 'span_bounds_slot.freezed.dart';

const spanBoundsSlot = Slot<SpanBounds>('spanBoundsSlot');

/// Une des deux bornes du span sélectionné.
enum SpanBound { start, end }

/// Une borne déplacée, avec sa position courante sur la polyline.
typedef BoundMove = ({SpanBound bound, double value});

/// Bornes du span sélectionné pendant leur ajustement, en positions sur la
/// polyline (même repère que `RouteHitDetail.position`).
///
/// Au plus une borne s'écarte de son origine : [moved] ne peut décrire
/// qu'un déplacement. Déplacer l'autre borne remplace [moved], et la
/// première retrouve son origine. L'état « les deux bornes déplacées » est
/// donc impossible à représenter.
///
/// Brouillon local : rien n'est envoyé au serveur avant la validation.
/// Déplacer [end] déplace aussi le début du span suivant.
@freezed
abstract class SpanBounds with _$SpanBounds {
  const SpanBounds._();

  const factory SpanBounds({
    /// Bornes d'origine : elles ne changent jamais pendant l'édition.
    required double originStart,
    required double originEnd,

    /// Borne actuellement déplacée, ou null si aucune.
    BoundMove? moved,
  }) = _SpanBounds;

  factory SpanBounds.at({required double start, required double end}) =>
      SpanBounds(originStart: start, originEnd: end);

  /// Déplace [bound] à [value]. Si une autre borne était déplacée, elle
  /// revient à son origine.
  SpanBounds withBoundAt(SpanBound bound, double value) =>
      copyWith(moved: (bound: bound, value: value));

  double origin(SpanBound bound) => switch (bound) {
    SpanBound.start => originStart,
    SpanBound.end => originEnd,
  };

  /// Position courante de [bound] : `bounds[SpanBound.end]`.
  double operator [](SpanBound bound) {
    final m = moved;
    return m != null && m.bound == bound ? m.value : origin(bound);
  }

  double get start => this[SpanBound.start];
  double get end => this[SpanBound.end];

  double get lower => min(start, end);
  double get upper => max(start, end);
}
