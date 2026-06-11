// class GraphLoader {
//   Future<void> loadTrip(int tripId);
// }

// @riverpod
// class WaypointsNotifier extends _$WaypointsNotifier {
//   GraphStore get graph => ref.read(graphStoreProvider);

//   @override
//   void build(int tripId) {
//     _load(tripId);
//   }

//   Future<void> _load(int tripId) async {
//     final repo = ref.read(waypointRepositoryProvider);

//     final result = await repo.getWaypoints(tripId);

//     result.fold((f) => throw Exception(f.message), (waypoints) {
//       for (final wp in waypoints) {
//         graph.upsert<Waypoint>(wp);
//       }
//     });
//   }

//   Map<int, Waypoint> get all => graph.getAll<Waypoint>();
// }

// @riverpod
// class SegmentsNotifier extends _$SegmentsNotifier {
//   SegmentRepository get repo => ref.read(segmentRepositoryProvider);

//   Future<Map<int, Segment>> _load() async {
//     final result = await repo.getSegments(tripId);
//     return result.fold(
//       (failure) => throw Exception(failure.message),
//       (segments) => {for (final segment in segments) segment.id: segment},
//     );
//   }

//   @override
//   Future<Map<int, Segment>> build(int tripId) async {
//     return await _load();
//   }

//   Future<void> refresh() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async => await _load());
//   }
// }

// @riverpod
// class VerticesNotifier extends _$VerticesNotifier {
//   GraphStore get graph => ref.read(graphStoreProvider);

//   Future<Map<int, Vertex>> _load() async {
//     final repo = ref.read(vertexRepositoryProvider);
//     final result = await repo.getVertices(tripId);
//     return result.fold(
//       (failure) => throw Exception(failure.message),
//       (trips) => {for (final trip in trips) trip.id: trip},
//     );
//   }

//   @override
//   Future<Map<int, Vertex>> build(int tripId) async {
//     return await _load();
//   }
// } // --- Providers Sélecteurs pour optimiser l'UI ---
