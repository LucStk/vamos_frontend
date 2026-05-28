// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/screens/utils/map_coordinator.dart';
import "../widgets/map_top_bar.dart";

class MapScreen extends ConsumerStatefulWidget {
  final int tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapStateProvider(widget.tripId));

    return PopScope(
      canPop: !mapState.isDirty,

      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) {
          await coordinator.handleBack(
            mapState.currentTrip,
            (trip) => _saveChanges(trip, coordinator),
          );
        }
      },

      child: Scaffold(body: Stack(children: [])),
    );
  }
}
// final mapState = ref.watch(mapStateProvider(trip));

//             final notifier = ref.read(mapStateProvider(trip).notifier);

//             final coordinator = MapCoordinator(context: context, ref: ref);

//             final editor = CustomPolyEditor(
//               trip: mapState.currentTrip,
//               notifier: notifier,
//             );

//             return PopScope(
//               canPop: !mapState.isDirty,

//               onPopInvokedWithResult: (didPop, _) async {
//                 if (!didPop) {
//                   await coordinator.handleBack(
//                     mapState.currentTrip,
//                     (trip) => _saveChanges(trip, coordinator),
//                   );
//                 }


  //         child: Scaffold(
  //           body: Stack(
  //             children: [
  //               MapView(
  //                 trip: mapState.currentTrip,
  //                 editor: editor,
  //                 editable: widget.isOwner,
  //                 mapController: _mapController,

  //                 contextMenuActions: _buildContextActions(
  //                   notifier,
  //                   coordinator,
  //                 ),

  //                 onWaypointTap: coordinator.showWaypointInfo,

  //                 onSegmentTypeMarkerTap: coordinator.showSegmentOptions,
  //               ),

  //               MapTopBar(
  //                 title: mapState.currentTrip.title.trim().isEmpty
  //                     ? 'Sans titre'
  //                     : mapState.currentTrip.title,

  //                 isDirty: mapState.isDirty,

  //                 onBack: () {
  //                   coordinator.handleBack(
  //                     mapState.currentTrip,
  //                     (trip) => _saveChanges(trip, coordinator),
  //                   );
  //                 },

  //                 onTitleTap: () {},
  //               ),

  //               MapControls(mapController: _mapController),

  //               if (_isSaving)
  //                 Positioned.fill(
  //                   child: ColoredBox(
  //                     color: Colors.black26,
  //                     child: Center(child: CircularProgressIndicator()),
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // Future<void> _saveChanges(Trip trip, MapCoordinator coordinator) async {
  //   if (widget.tripId == null) return;

  //   setState(() => _isSaving = true);

  //   try {
  //     await ref.read(tripProvider(widget.tripId!).notifier).save(trip);

  //     coordinator.showSnackBar(
  //       message: 'Voyage enregistré avec succès',
  //       isError: false,
  //     );

  //     ref.read(mapStateProvider(trip).notifier).resetSnapshots();
  //   } catch (e) {
  //     coordinator.showSnackBar(
  //       message: 'Erreur lors de la sauvegarde : $e',
  //       isError: true,
  //     );
  //   } finally {
  //     setState(() => _isSaving = false);
  //   }
  // }
  // List<MapContextAction> _buildContextActions(
  //   MapStateNotifier notifier,
  //   MapCoordinator coordinator,
  // ) {
  //   return [
  //     if (widget.isOwner)
  //       MapContextAction(
  //         icon: Icons.add_location_alt,
  //         label: 'Créer un point',
  //         onTap: (latLng) async {
  //           notifier.addWaypoint(latLng);

  //           await _saveChanges(notifier.state.currentTrip, coordinator);
  //         },
  //       ),

  //     MapContextAction(
  //       icon: Icons.my_location,
  //       label: 'Centrer ici',
  //       onTap: (latLng) async {
  //         _mapController.move(latLng, _mapController.camera.zoom);
  //       },
  //     ),
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   if (widget.tripId == null) {
  //     return const Scaffold(body: Center(child: Text('ID de voyage manquant')));
  //   }

  //   final tripAsync = ref.watch(tripProvider(widget.tripId!));

  //   return tripAsync.when(
  //     loading: () =>
  //         const Scaffold(body: Center(child: CircularProgressIndicator())),

  //     error: (err, _) => Scaffold(body: Center(child: Text('Erreur : $err'))),

  //     data: (trip) {
  //       final mapState = ref.watch(mapStateProvider(trip));

  //       final notifier = ref.read(mapStateProvider(trip).notifier);

  //       final coordinator = MapCoordinator(context: context, ref: ref);

  //       final editor = CustomPolyEditor(
  //         trip: mapState.currentTrip,
  //         notifier: notifier,
  //       );

  //       return PopScope(
  //         canPop: !mapState.isDirty,

  //         onPopInvokedWithResult: (didPop, _) async {
  //           if (!didPop) {
  //             await coordinator.handleBack(
  //               mapState.currentTrip,
  //               (trip) => _saveChanges(trip, coordinator),
  //             );
  //           }
  //         },

  //         child: Scaffold(
  //           body: Stack(
  //             children: [
  //               MapView(
  //                 trip: mapState.currentTrip,
  //                 editor: editor,
  //                 editable: widget.isOwner,
  //                 mapController: _mapController,

  //                 contextMenuActions: _buildContextActions(
  //                   notifier,
  //                   coordinator,
  //                 ),

  //                 onWaypointTap: coordinator.showWaypointInfo,

  //                 onSegmentTypeMarkerTap: coordinator.showSegmentOptions,
  //               ),

  //               MapTopBar(
  //                 title: mapState.currentTrip.title.trim().isEmpty
  //                     ? 'Sans titre'
  //                     : mapState.currentTrip.title,

  //                 isDirty: mapState.isDirty,

  //                 onBack: () {
  //                   coordinator.handleBack(
  //                     mapState.currentTrip,
  //                     (trip) => _saveChanges(trip, coordinator),
  //                   );
  //                 },

  //                 onTitleTap: () {},
  //               ),

  //               MapControls(mapController: _mapController),

  //               if (_isSaving)
  //                 Positioned.fill(
  //                   child: ColoredBox(
  //                     color: Colors.black26,
  //                     child: Center(child: CircularProgressIndicator()),
  //                   ),
  //                 ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
