// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/map.dart';

@Dependencies([
  mapScene,
  mapController,
  mapGestureHandler,
  cameraDirector,
  mapCamera,
  MapCameraChanges,
  mapCameraSnapshot,
])
class BaseMap extends ConsumerWidget {
  const BaseMap({
    super.key,
    required this.overlayChildren,
    this.cameraTriggers = const [],
  });

  final List<ProviderListenable<void>> cameraTriggers;
  final List<Widget> overlayChildren;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraDirectorProvider);

    for (final trigger in cameraTriggers) {
      ref.watch(trigger);
    }

    return Stack(
      children: [
        MapGestureBridge(mapLayers: [MapTileLayer()]),
        const MapControls(),
        ...overlayChildren,
      ],
    );
  }
}
