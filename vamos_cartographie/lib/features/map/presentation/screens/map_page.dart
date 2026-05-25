// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_state_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/screens/utils/map_coordinator.dart';

class MapPage extends ConsumerStatefulWidget {
  final int? tripId;
  final bool isOwner;

  const MapPage({super.key, this.tripId, this.isOwner = true});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends ConsumerState<MapPage> {
  final MapController _mapController = MapController();
  late CustomPolyEditor _editor;
  bool _isSaving = false;

  CustomPolyEditor _refreshEditor(Trip trip) {
    return CustomPolyEditor(
      trip: trip,
      callbackRefresh: (_) =>
          ref.read(mapStateProvider.notifier).setDirty(true),
      onSegmentMidpointInserted: (_) =>
          ref.read(mapStateProvider.notifier).setDirty(true),
      onIntermediatePointDeleted: (_, __) =>
          ref.read(mapStateProvider.notifier).setDirty(true),
    );
  }

  Future<void> _saveChanges(Trip trip, MapCoordinator coordinator) async {
    if (widget.tripId == null) return;
    setState(() => _isSaving = true);

    try {
      await ref.read(tripProvider(widget.tripId!).notifier).save(trip);
      coordinator.showSnackBar(
        message: 'Voyage enregistré avec succès',
        isError: false,
      );
      ref.read(mapStateProvider.notifier).confirmAddPoint();
    } catch (e) {
      coordinator.showSnackBar(
        message: 'Erreur lors de la sauvegarde : $e',
        isError: true,
      );
    } finally {
      setState(() => _isSaving = false);
    }
  }

  List<MapContextMenuOption> _buildContextMenuOptions(
    MapStateNotifier notifier,
    Trip trip,
    MapCoordinator coordinator,
  ) {
    return [
      if (widget.isOwner)
        MapContextMenuOption(
          icon: Icons.add_location_alt,
          label: 'Créer un point',
          onTap: (latLng) async {
            notifier.addWaypoint(trip, latLng);
            await _saveChanges(trip, coordinator);
          },
        ),
      MapContextMenuOption(
        icon: Icons.my_location,
        label: 'Centrer ici',
        onTap: (latLng) =>
            _mapController.move(latLng, _mapController.camera.zoom),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tripId == null) {
      return const Scaffold(
        body: Center(child: Text("ID de voyage manquant.")),
      );
    }

    // Initialisation du coordinateur pour cet arbre de widgets
    final coordinator = MapCoordinator(context: context, ref: ref);

    final mapState = ref.watch(mapStateProvider);
    final mapStateNotifier = ref.read(mapStateProvider.notifier);
    final tripAsync = ref.watch(tripProvider(widget.tripId!));

    return tripAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) =>
          Scaffold(body: Center(child: Text('Erreur : $err'))),
      data: (trip) {
        _editor = _refreshEditor(trip);

        return PopScope(
          canPop: !(mapState.isDirty && mapState.mode != MapMode.observer),
          onPopInvokedWithResult: (didPop, _) async {
            if (!didPop)
              await coordinator.handleBack(
                trip,
                (t) => _saveChanges(t, coordinator),
              );
          },
          child: Scaffold(
            body: Stack(
              children: [
                MapView(
                  trip: trip,
                  editor: _editor,
                  editable: mapState.mode == MapMode.editRoute,
                  mapController: _mapController,
                  onTap: mapState.mode == MapMode.addPoint
                      ? (latLng) => mapStateNotifier.addWaypoint(trip, latLng)
                      : null,
                  contextMenuOptions: mapState.mode == MapMode.observer
                      ? _buildContextMenuOptions(
                          mapStateNotifier,
                          trip,
                          coordinator,
                        )
                      : null,
                  onSegmentTypeMarkerTap: mapState.mode == MapMode.editRoute
                      ? (index) => coordinator.showSegmentOptions(index, trip)
                      : null,
                  onWaypointTap: coordinator.showWaypointInfo,
                ),
                MapTopBar(
                  title: trip.title.trim().isEmpty
                      ? 'Sans titre'
                      : trip.title.trim(),
                  isDirty: mapState.isDirty,
                  onBack: () => coordinator.handleBack(
                    trip,
                    (t) => _saveChanges(t, coordinator),
                  ),
                  onTitleTap: () {},
                ),
                MapControls(mapController: _mapController),
                if (_isSaving)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black26,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                if (widget.isOwner && mapState.mode == MapMode.observer) ...[
                  MapEditFab(
                    isActive: false,
                    onTap: () => mapStateNotifier.enterEditRoute(trip),
                  ),
                ],
                if (mapState.mode == MapMode.editRoute)
                  MapEditRouteBar(
                    onSave: () => _saveChanges(trip, coordinator),
                    onCancel: () => mapStateNotifier.cancelEditRoute(trip),
                  ),
                if (mapState.mode == MapMode.addPoint)
                  MapAddPointBar(
                    onConfirm: mapStateNotifier.confirmAddPoint,
                    onCancel: () => mapStateNotifier.cancelAddPoint(trip),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
