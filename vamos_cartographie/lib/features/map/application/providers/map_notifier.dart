// features/map/presentation/providers/map_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import "package:vamos_cartographie/features/map/application/states/states.dart";

part 'map_notifier.g.dart';

// Permet d'accéder au trip actuel sans prop drilling le tripId
final currentTripIdProvider = Provider<int>((ref) {
  throw UnimplementedError();
});

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  @override
  MapState build(int tripId) {
    final trip = ref.read(tripProvider(tripId));
    if (trip == null) {
      throw Exception('Trip introuvable');
    }
    return MapState.fromTrip(trip);
  }

  void startWaypointCreation(LatLng position) {
    print("startWaypointCreation {$position}");
    state = state.copyWith(
      interaction: MapInteraction.creatingWaypoint(position: position),
    );
  }

  void updatePendingWaypointPosition(LatLng position) {
    state.interaction.mapOrNull(
      creatingWaypoint: (interaction) {
        state = state.copyWith(
          interaction: interaction.copyWith(position: position),
        );
      },
    );
  }

  void cancelInteraction() {
    state = state.copyWith(interaction: const MapInteraction.none());
  }

  void moveIntermediatePoint(int segmentIndex, int pointIndex, LatLng latLng) {
    final segments = [...state.segments];
    final segment = segments[segmentIndex];
    final vertices = [...segment.middleVertices];

    if (vertices.isEmpty || pointIndex >= vertices.length) return;
    if (vertices[pointIndex].point == latLng) return;

    vertices[pointIndex] = SegmentVertex(
      id: vertices[pointIndex].id,
      point: latLng,
    );
    segments[segmentIndex] = segment.copyWith(middleVertices: vertices);

    state = state.copyWith(segments: segments);
  }
}
