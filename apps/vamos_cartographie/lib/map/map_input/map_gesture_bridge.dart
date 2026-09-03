// import 'package:domain_core/id.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_map/flutter_map.dart' hide MapEvent;
// import 'package:flutter_map_animations/flutter_map_animations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:map_application/map_application.dart';
// import 'package:trip_application/trip_application.dart';
// import 'package:vamos_cartographie/map/canvas/map_canvas.dart';
// import 'package:vamos_cartographie/map/injection/injection.dart';
// import 'flutter_map_camera_controller.dart';
// import 'package:vamos_cartographie/topology/topology.dart';

// class MapGestureBridge extends ConsumerStatefulWidget {
//   final Id<Trip> tripId;

//   const MapGestureBridge({super.key, required this.tripId});

//   @override
//   ConsumerState<MapGestureBridge> createState() => _MapGestureBridgeState();
// }

// class _MapGestureBridgeState extends ConsumerState<MapGestureBridge>
//     with TickerProviderStateMixin {
//   late final MapController _mapController;
//   late final AnimatedMapController _animatedMapController;
//   late final MapHitTester _hitTester;
//   late final PointerGestureController _gestureController;

//   final ValueNotifier<bool> _panAllowed = ValueNotifier(
//     true,
//   ); // remplace panMapControllerProvider

//   MapEditor get _mapEditor =>
//       ref.read(mapStateProvider(widget.tripId).notifier);

//   GestureStateNotifier get _gestureState =>
//       ref.read(gestureStateProvider(widget.tripId).notifier);

//   @override
//   void initState() {
//     super.initState();
//     _mapController = MapController();
//     _animatedMapController = AnimatedMapController(
//       vsync: this,
//       mapController: _mapController, // même instance sous-jacente
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOutCubic,
//     );
//     _hitTester = MapHitTester(
//       hitMode: () => _mapEditor.mode,
//       hitSelection: () => _mapEditor.selection,
//       vertices: () => ref.read(allVertexProvider(widget.tripId)),
//       segments: () => ref.read(allSegmentsProvider(widget.tripId)),
//       project: (latLng) => _mapEditor.camera.latLngToPoint(latLng),
//     );

//     _gestureController = PointerGestureController(
//       hitTester: _hitTester,
//       mapEditor: _mapEditor,
//       setPanBlocked: (blocked) => _panAllowed.value = !blocked,
//     );

//     _mapEditor.attachCamera(FlutterMapCameraController(_animatedMapController));
//   }

//   /// Point d'entrée unique côté widget : traduit un Offset écran en LatLng,
//   /// construit l'événement, applique la transition via le contrôleur pur,
//   /// et persiste le nouvel état dans le notifier.
//   void _dispatch(MapPointerEvent Function(LatLng) buildEvent, Offset offset) {
//     final latLng = _mapController.camera.screenOffsetToLatLng(offset);
//     final event = buildEvent(latLng);
//     _gestureState.dispatch(_gestureController, event);
//   }

//   @override
//   void dispose() {
//     _panAllowed.dispose();
//     _gestureController.dispose();
//     _animatedMapController.dispose();
//     _mapController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _mapEditor.attachCamera(FlutterMapCameraController(_animatedMapController));

//     return Listener(
//       behavior: HitTestBehavior.translucent,
//       onPointerDown: (event) =>
//           _dispatch(MapPointerDown.new, event.localPosition),
//       onPointerMove: (event) =>
//           _dispatch(MapPointerMove.new, event.localPosition),
//       onPointerUp: (event) => _dispatch(MapPointerUp.new, event.localPosition),
//       child: MapCanvas(
//         tripId: widget.tripId,
//         mapController: _mapController,
//         panAllowed: _panAllowed,
//       ),
//     );
//   }
// }
