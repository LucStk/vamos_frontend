import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:vamos_cartographie/map/rendering/animation/visual_transitions.dart';

/// Peint les items de la scène en une passe.
///
/// - [zoomScale] == null : passe invariante au zoom (géométrie monde, mise à
///   l'échelle par le `Transform` parent). Elle ne se repeint que si les
///   items changent ou sur un tick d'animation.
/// - [zoomScale] != null : passe dépendante du zoom (tailles écran
///   constantes). Elle se repeint à chaque changement de zoom, SANS
///   reconstruire de widget : la valeur est lue au moment de `paint`.
class ScenePainter extends CustomPainter {
  ScenePainter({required this.items, required this.transitions, this.zoomScale})
    : super(repaint: Listenable.merge([transitions.ticks, zoomScale]));

  final List<SceneItem> items;
  final VisualTransitions transitions;
  final ValueListenable<double>? zoomScale;

  @override
  void paint(Canvas canvas, Size size) {
    final zoom = zoomScale?.value;
    final renderer = zoom == null
        ? MapCommandRenderer.zoomInvariant(canvas)
        : MapCommandRenderer.zoomDependent(canvas, zoomScale: zoom);
    renderer.paintAll(transitions.commandsFor(items));
  }

  @override
  bool shouldRepaint(ScenePainter old) =>
      !identical(items, old.items) || zoomScale != old.zoomScale;
}

/// Deux couches : l'une invariante au zoom, l'autre dépendante.
/// Plus de Riverpod ici : le zoom arrive sous forme de [ValueListenable].
class SceneLayer extends StatelessWidget {
  const SceneLayer({
    super.key,
    required this.items,
    required this.transitions,
    required this.zoomScale,
    required this.size,
  });

  final List<SceneItem> items;
  final VisualTransitions transitions;
  final ValueListenable<double> zoomScale;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RepaintBoundary(
          child: CustomPaint(
            size: size,
            painter: ScenePainter(items: items, transitions: transitions),
          ),
        ),
        RepaintBoundary(
          child: CustomPaint(
            size: size,
            painter: ScenePainter(
              items: items,
              transitions: transitions,
              zoomScale: zoomScale,
            ),
          ),
        ),
      ],
    );
  }
}
