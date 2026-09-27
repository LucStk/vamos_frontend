import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/application/application.dart';

import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:map_canvas/domain/domain.dart';

@Dependencies([mapScene, mapCameraSnapshot])
class MapScenePaint extends ConsumerStatefulWidget {
  const MapScenePaint({super.key});

  @override
  ConsumerState<MapScenePaint> createState() => _MapScenePaintState();
}

class _MapScenePaintState extends ConsumerState<MapScenePaint>
    with SingleTickerProviderStateMixin {
  late final _selectionAnim = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 180),
  );

  Object? _previousSelection;

  @override
  void dispose() {
    _selectionAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(mapSceneProvider.select((s) => s.selection), (prev, next) {
      _previousSelection = prev;
      _selectionAnim.forward(from: 0);
    });

    final scene = ref.watch(mapSceneProvider);
    final size = ref.watch(mapCameraSnapshotProvider.select((c) => c.size));

    return CameraTransform(
      child: Stack(
        children: [
          RepaintBoundary(child: CustomPaint(size: size)),

          // World : pas concerné par l'anim de sélection (ProjectedVertex dessine en ScreenScale)
          RepaintBoundary(
            child: CustomPaint(
              size: size,
              painter: MapScenePainter(
                objects: scene.objects,
                selection: scene.selection,
              ),
            ),
          ),

          // Screen : repaint au zoom (via ref.watch) ET à chaque tick de l'anim (via repaint:)
          RepaintBoundary(
            child: _ScreenLayer(
              objects: scene.objects,
              selection: scene.selection,
              previousSelection: _previousSelection,
              selectionAnim: _selectionAnim,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}

@Dependencies([mapCameraSnapshot])
class _ScreenLayer extends ConsumerWidget {
  const _ScreenLayer({
    required this.objects,
    required this.selection,
    required this.previousSelection,
    required this.selectionAnim,
    required this.size,
  });

  final Iterable<ProjectedObject> objects;
  final Object? selection;
  final Object? previousSelection;
  final Animation<double>
  selectionAnim; // AnimationController EST un Animation<double>
  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zoom = ref.watch(
      mapCameraSnapshotProvider.select((c) => c.zoomScale),
    );
    return CustomPaint(
      size: size,
      painter: ScreenSpacePainter(
        objects: objects,
        selection: selection,
        previousSelection: previousSelection,
        zoomScale: zoom,
        selectionAnim: selectionAnim,
      ),
    );
  }
}

class ScreenSpacePainter extends CustomPainter {
  ScreenSpacePainter({
    required this.objects,
    required this.selection,
    required this.previousSelection,
    required this.zoomScale,
    required this.selectionAnim,
  }) : super(
         repaint: selectionAnim,
       ); // <-- la clé : mêmes instance, repaint direct

  final Iterable<ProjectedObject> objects;
  final Object? selection;
  final Object? previousSelection;
  final double zoomScale;
  final Animation<double> selectionAnim;

  @override
  void paint(Canvas canvas, Size size) {
    final t =
        selectionAnim.value; // <-- lu à CHAQUE paint(), c'est ça qui anime
    final commands = [
      for (final object in objects.toList().reversed)
        object.describe(
          context: MapPaintContext(
            selection: selection != null && selection!.isSameAs(object.object)
                ? t
                : previousSelection != null &&
                      previousSelection!.isSameAs(object.object)
                ? 1 - t
                : 0.0,
          ),
        ),
    ];
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.screen,
      zoomScale: zoomScale,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(ScreenSpacePainter old) =>
      !identical(objects, old.objects) ||
      selection != old.selection ||
      previousSelection != old.previousSelection ||
      zoomScale != old.zoomScale;
}

class MapScenePainter extends CustomPainter {
  MapScenePainter({required this.objects, required this.selection});

  final Iterable<ProjectedObject>
  objects; // adapte au vrai type de scene.objects
  final Object? selection;

  @override
  void paint(Canvas canvas, Size size) {
    final commands = [
      for (final object in objects.toList().reversed)
        object.describe(
          context: MapPaintContext(
            state: (selection != null && selection!.isSameAs(object.object))
                ? MapObjectVisualState.selected
                : MapObjectVisualState.normal,
          ),
        ),
    ];
    MapCommandRenderer(
      canvas: canvas,
      layer: MapRenderSpace.world,
    ).paintAll(commands);
  }

  @override
  bool shouldRepaint(MapScenePainter old) =>
      !identical(objects, old.objects) || selection != old.selection;
}
