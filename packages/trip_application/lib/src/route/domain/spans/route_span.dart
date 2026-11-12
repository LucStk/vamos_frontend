import 'package:domain_core/domain_core.dart';

/// Ce que partagent les spans de tous les calques de la route.
///
/// Un span couvre les vertex de `startIndex` au début du span suivant DU MÊME
/// CALQUE (ou au dernier vertex). Les calques sont indépendants : une frontière
/// de modalité ne tombe pas forcément sur une frontière d'édition.
///
/// Pas `sealed` : chaque calque déclare sa propre interface scellée
/// (`MobilitySpanFields`, …) dans son fichier, et Dart n'autorise les sous-types
/// d'une classe scellée que dans sa propre bibliothèque.
abstract interface class RouteSpanFields implements HasId {
  int get startIndex;

  /// Longueur en mètres, calculée par le serveur. Null pour un span local
  /// pas encore confirmé.
  double? get lengthM;

  @override
  SpanId get id;
}

/// Identifiant d'un span, quel que soit son calque : les ids sont uniques
/// tous calques confondus, et une ancre d'édition peut viser n'importe lequel.
typedef SpanId = Id<RouteSpanFields>;

/// Lectures d'un calque. La liste doit être triée par `startIndex`, ce que
/// le serveur garantit.
extension SpanLayer<S extends RouteSpanFields> on List<S> {
  /// Span qui contient l'arête `edge` (de `edge` à `edge + 1`).
  ///
  /// Même règle que le serveur (`value_at`) : le départ de la route est au
  /// premier span, l'arrivée au dernier.
  S containingEdge(int edge) => lastWhere((s) => s.startIndex <= edge);

  /// Vertex de fin (inclus) du span d'index `i`.
  int endVertexOf(int i, {required int lastVertex}) =>
      i + 1 < length ? this[i + 1].startIndex : lastVertex;
}
