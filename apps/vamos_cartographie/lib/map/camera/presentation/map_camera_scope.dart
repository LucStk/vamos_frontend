import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/map.dart';

// import 'package:riverpod_annotation/experimental/scope.dart';

// @Dependencies([
//   mapGestureHandler,
//   exploreScene,
//   MapExplore,
//   userLocationTrigger,
//   tripBoundsTrigger,
//   mapGestureHandler,
//   cameraDirector,
//   mapCamera,
//   MapCameraChanges,
//   mapCameraSnapshot,
// ])
class MapCameraScope extends StatefulWidget {
  const MapCameraScope({super.key, required this.child});
  final Widget child;

  @override
  State<MapCameraScope> createState() => _MapCameraScopeState();
}

class _MapCameraScopeState extends State<MapCameraScope>
    with TickerProviderStateMixin {
  late final _camera = FlutterMapCamera(MapController());

  @override
  void initState() {
    super.initState();
    _camera.attachAnimatedController(this);
  }

  @override
  void dispose() {
    _camera.detachAnimatedController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [mapCameraProvider.overrideWithValue(_camera)],
      child: widget.child,
    );
  }
}
