import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/screens/utils/utils.dart';
import 'package:vamos_cartographie/features/map/domain/entities/entities.dart';

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

  void _onMapTap(LatLng latLng) {
    _mapNotifier.startWaypointCreation(latLng);
  }

  void _onWaypointDragged(Waypoint waypoint, LatLng newLatLng) {
    _mapNotifier.updateWaypointPosition(waypoint, newLatLng);
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapStateProvider(_tripId));
    ref.listen<MapState>(mapStateProvider(_tripId), (prev, next) {
      if (prev?. != next.selectedWaypointId &&
          next.selectedWaypointId != null) {
        WaypointViewerDialog.show(
          context: context,
          waypointId: next.selectedWaypointId!,
          tripId: _tripId,
        );
      }
    });
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(46.8, 2.2),
        initialZoom: 7,
        onTap: (_, latLng) => _onMapTap(latLng),
      ),
      children: [
        buildMapTileLayer(),
        buildWaypointsDragMarkers(
          waypoints: mapState.waypoints,
          dragEnd: (waypoint, latLng, _) =>
              _onWaypointDragged(waypoint, latLng),
          onTap: (waypoint, latLng) => _mapNotifier.openWaypoint(waypoint.id),
        ),
      ],
    );
  }
}
