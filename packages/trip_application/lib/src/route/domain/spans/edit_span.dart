import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/src/route/domain/spans/route_span.dart';

part 'edit_span.freezed.dart';

enum GeometrySource { computed, drawn }

/// Identifiant d'une édition (une action de l'utilisateur). Plusieurs spans
/// peuvent le partager : un retracé au milieu d'une édition la coupe en deux.
/// Ce n'est pas un id de span, d'où un type distinct de `SpanId`.
extension type const EditId(String value) {}

/// Calque d'édition : la partie produite par chaque action de l'utilisateur.
/// Mode édition seulement. Lecture seule côté client : il n'est modifié que
/// par les éditions de la route, qui attendent la réponse du serveur.
@freezed
abstract class EditSpan with _$EditSpan implements RouteSpanFields {
  const factory EditSpan({
    required SpanId id,
    required int startIndex,
    required EditId editId,
    required GeometrySource geometrySource,
    double? lengthM,
  }) = _EditSpan;
}
