import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/map/presentation/dialogs/waypoint_creator_dialog.dart';
import 'package:vamos_cartographie/features/map/presentation/layers/layers.dart';
import 'package:vamos_cartographie/features/map/presentation/dialogs/dialogs.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  late final MapController _mapController;

  int get _tripId => ref.read(currentTripIdProvider);

  MapStateNotifier get _mapNotifier =>
      ref.read(mapStateProvider(_tripId).notifier);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _onMapTap(BuildContext context, LatLng latLng) {
    // _mapNotifier.startWaypointCreation(latLng);
    WaypointCreatorDialog.show(
      context: context,
      latLng: latLng,
      tripId: _tripId,
    );
  }

  void _showWaypoint(int waypointId) {
    WaypointViewerDialog.show(
      context: context,
      waypointId: waypointId,
      tripId: _tripId,
    );
  }

  List<Widget> _buildInteractionLayers(MapState mapState) {
    return mapState.interaction.map(
      none: (_) => [],

      creatingWaypoint: (interaction) => [
        // MapContextMenu(
        //   position: interaction.position,
        //   onClose: _mapNotifier.cancelInteraction,
        // ),
      ],

      creatingSegment: (_) => [],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapStateProvider(_tripId));

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(46.8, 2.2),
        initialZoom: 7,
        onTap: (_, latLng) => _onMapTap(context, latLng),
      ),
      children: [
        MapTileLayer(),
        DragMarkers(
          markers: [
            ...mapState.waypoints.map((w) {
              return w.toDragMarker(
                onDragUpdate: _mapNotifier.updateWaypointPositionLocal,
                onDragEnd: _mapNotifier.updateWaypointPositionLocal,
                onTap: _showWaypoint,
              );
            }),
          ],
        ),
      ],
    );
  }
}
