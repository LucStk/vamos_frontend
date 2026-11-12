import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_vector_tiles/flutter_map_vector_tiles.dart' as vt;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import 'package:vamos_cartographie/map/camera/flutter_map_camera.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/map_gesture_handler.dart';
import 'package:vamos_cartographie/map/layers/map_style_provider.dart';
import 'package:vamos_cartographie/map/rendering/map_scene_paint.dart';

@Dependencies([MapGestureHandlerNotifier])
class MapCanvas extends ConsumerStatefulWidget {
  const MapCanvas({super.key});

  @override
  ConsumerState<MapCanvas> createState() => _MapCanvasState();
}

class _MapCanvasState extends ConsumerState<MapCanvas> {
  MapOptions? _options;
  FlutterMapCamera? _optionsCamera;
  bool? _optionsPanAllowed;

  final _vectorController = vt.VectorTileLayerController();

  MapOptions _optionsFor(FlutterMapCamera camera, bool panAllowed) {
    if (_options == null ||
        !identical(_optionsCamera, camera) ||
        _optionsPanAllowed != panAllowed) {
      _optionsCamera = camera;
      _optionsPanAllowed = panAllowed;

      _options = MapOptions(
        onMapReady: camera.markReady,
        initialCameraFit: camera.initialCameraFit,
        initialCenter: const LatLng(46.8, 2.2),
        initialZoom: 7,
        interactionOptions: InteractionOptions(
          flags: panAllowed
              ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
              : InteractiveFlag.all &
                    ~InteractiveFlag.doubleTapZoom &
                    ~InteractiveFlag.drag,
        ),
      );
    }
    return _options!;
  }

  @override
  Widget build(BuildContext context) {
    final camera = ref.watch(mapCameraProvider);
    final panAllowed = ref.watch(mapGestureHandlerProvider);
    final styleAsync = ref.watch(mapStyleProvider);

    return Stack(
      children: [
        FlutterMap(
          mapController: camera.mapController,
          options: _optionsFor(camera, panAllowed),
          children: [
            if (styleAsync case AsyncData(:final value))
              vt.VectorTileLayer(
                key: ValueKey(value),
                theme: value.theme,
                tileProviders: value.providers,
                rasterSources: value.rasterSources,
                sprites: value.sprites,
                glyphs: value.glyphs,
                controller: _vectorController,
                logger: const vt.Logger.console(),
              ),
            MapScenePaint(),
          ],
        ),
        if (styleAsync.isLoading)
          const Center(child: CupertinoActivityIndicator()),
        if (styleAsync.hasError)
          Center(child: Text('Erreur de chargement : ${styleAsync.error}')),
      ],
    );
  }
}
