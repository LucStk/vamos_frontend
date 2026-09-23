// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'widgets/widgets.dart';

class MapScreen extends ConsumerWidget {
  final MapCameraReader mapCameraReader;
  final OnGesture onGesture;
  final HitTest hitTest;
  final Widget mapCanvas;

  const MapScreen({
    super.key,
    required this.hitTest,
    required this.mapCameraReader,
    required this.onGesture,
    required this.mapCanvas,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MapGestureBridge(
      onGesture: onGesture,
      hitTest: hitTest,
      mapCameraReader: mapCameraReader,
      child: mapCanvas,
    );
  }
}
