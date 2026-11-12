import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/scene/map_layer.dart';

/// Source de traits d'une scène : quels objets portent quels traits.
typedef TraitSource =
    Map<Object, Set<VisualTrait>> Function(Ref ref, MapCameraReader cam);

/// Ce qu'une scène déclare : ses couches, et ce qu'elle met en avant.
///
/// Les traits d'interaction (hover, drag) ne sont pas ici : ils viennent du
/// moteur de gestes et valent pour toutes les scènes. Une scène ne déclare
/// que sa mise en avant sémantique (sélection, etc.).
final class SceneSpec {
  const SceneSpec({required this.layers, this.traits = const []});

  /// Ordre « dessus d'abord » : la première couche est dessinée en dernier.
  final List<Layer> layers;

  final List<TraitSource> traits;
}

/// Donne [trait] à tous les objets des items de [layer].
///
/// La clé est exactement `item.object` : aucun risque de construire une clé
/// qui ne serait pas `==` à celle de l'item. Un badge qui partage le même
/// objet que son segment reçoit le trait lui aussi.
TraitSource traitOn(VisualTrait trait, Layer layer) =>
    (ref, cam) => {
      for (final item in layer(ref, cam)) item.object: {trait},
    };

/// Fusionne plusieurs sources : les traits d'un même objet se cumulent.
Map<Object, Set<VisualTrait>> mergeTraits(
  Iterable<Map<Object, Set<VisualTrait>>> sources,
) {
  final out = <Object, Set<VisualTrait>>{};
  for (final source in sources) {
    for (final e in source.entries) {
      (out[e.key] ??= {}).addAll(e.value);
    }
  }
  return out;
}
