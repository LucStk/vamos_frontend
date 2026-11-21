// modes/edit_route/slots/span_bounds_slot.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

part 'span_bounds_slot.freezed.dart';

/// La modification en cours : null tant qu'aucune borne n'a été déplacée.
const spanBoundsSlot = Slot<SpanBounds>('spanBoundsSlot');

/// Une des deux bornes du span sélectionné.
enum SpanBound { start, end }

/// La borne déplacée et sa position courante sur la polyline (même repère
/// que `RouteHitDetail.position`).
///
/// Une seule valeur, donc une seule borne à la fois : déplacer l'autre
/// remplace celle-ci, et la première retrouve son origine. L'origine des
/// bornes n'est pas ici : elle se lit dans `mobilitySpanExtentsProvider`.
///
/// Brouillon local : rien n'est envoyé au serveur avant la validation.
@freezed
abstract class SpanBounds with _$SpanBounds {
  const factory SpanBounds({required SpanBound bound, required double value}) =
      _SpanBounds;
}

/// Positions courantes des deux bornes : la valeur du brouillon pour la
/// borne déplacée, l'origine (lue dans les providers) pour l'autre.
({double start, double end}) currentBounds(
  SpanBounds? draft, {
  required double originStart,
  required double originEnd,
}) => (
  start: switch (draft) {
    SpanBounds(bound: SpanBound.start, :final value) => value,
    _ => originStart,
  },
  end: switch (draft) {
    SpanBounds(bound: SpanBound.end, :final value) => value,
    _ => originEnd,
  },
);
