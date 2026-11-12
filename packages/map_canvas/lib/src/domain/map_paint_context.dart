import 'visual_trait.dart';

/// Ce qui change d'une frame à l'autre pour un objet, alors que l'item,
/// lui, reste en cache.
class MapPaintContext {
  const MapPaintContext({this.weights = VisualWeights.none, this.time = 0});

  /// Poids animés des traits (hover, sélection, drag), déjà lissés par le
  /// moteur : le style n'a qu'à composer.
  final VisualWeights weights;

  /// Secondes écoulées, horloge continue pour les animations en boucle.
  /// Vaut 0 quand aucune boucle ne tourne.
  final double time;
}
