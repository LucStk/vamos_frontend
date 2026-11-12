import 'package:map_canvas/map_canvas.dart';

/// Remonte les items actifs en tête de leur groupe, sans changer l'ordre
/// relatif à l'intérieur des actifs ni des inactifs (tri stable).
///
/// La liste est en ordre « dessus d'abord » (elle est dessinée à l'envers).
/// Un groupe = une suite d'items consécutifs du même type : un segment
/// survolé passe au-dessus des autres segments, mais jamais au-dessus des
/// poignées ou des marqueurs d'une autre couche.
///
/// Le même ordre doit servir au dessin ET au hit-test, sinon on toucherait
/// un objet différent de celui qu'on voit au-dessus.
List<SceneItem> elevateActive(
  List<SceneItem> items,
  bool Function(Object key) isActive,
) {
  final result = <SceneItem>[];
  var start = 0;
  while (start < items.length) {
    final type = items[start].runtimeType;
    var end = start + 1;
    while (end < items.length && items[end].runtimeType == type) {
      end++;
    }
    final run = items.sublist(start, end);
    result
      ..addAll(run.where((i) => isActive(i.object)))
      ..addAll(run.where((i) => !isActive(i.object)));
    start = end;
  }
  return result;
}
