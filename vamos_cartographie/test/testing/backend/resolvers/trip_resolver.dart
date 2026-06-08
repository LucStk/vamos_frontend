import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../fake_graphql_store.dart';
import 'gql_mappers.dart';

/// Résout les opérations GraphQL relatives aux trips.
///
/// Chaque méthode lit ou mutate le [FakeGraphQLStore], puis retourne un
/// [Map<String, dynamic>] prêt à être émis par [FakeLink] via
/// `G*Data(...).toJson()`.
class TripResolver {
  final FakeGraphQLStore store;

  TripResolver(this.store);

  // ── Queries ──────────────────────────────────────────────────────────────────

  Map<String, dynamic> getAllTrips() {
    final trips = store.trips.values.map(tripFieldsToGql).toList();
    return GGetAllTripsData(trips: trips).toJson();
  }

  Map<String, dynamic> getTrip(int id) {
    final base = store.trips[id];
    if (base == null) throw Exception('Trip introuvable : id=$id');

    final waypointIds = store.tripWaypointIds[id] ?? [];
    final segmentIds = store.tripSegmentIds[id] ?? [];
    final vertexIds = store.tripVertexIds[id] ?? [];

    final waypoints = waypointIds.map((wId) {
      final w = store.waypoints[wId]!;
      final v = store.vertices[w.vertexId]!;
      return waypointToGql(w, v);
    }).toList();

    final segments = segmentIds.map((sId) {
      final s = store.segments[sId]!;
      return segmentToGql(
        s,
        store.vertices[s.startVertexId]!,
        store.vertices[s.endVertexId]!,
      );
    }).toList();

    final vertices = vertexIds
        .map((vId) => vertexToGql(store.vertices[vId]!))
        .toList();

    return GGetTripData(
      trip: GGetTripData_trip(
        id: base.id,
        title: base.title,
        description: base.description,
        date: base.date?.toIso8601String().substring(0, 10),
        images: base.images
            .map((img) => GGetTripData_trip_images(image: imageToGql(img)))
            .toList(),
        waypoints: waypoints,
        topology: GGetTripData_trip_topology(
          vertices: vertices,
          segments: segments,
        ),
      ),
    ).toJson();
  }

  // ── Mutations ─────────────────────────────────────────────────────────────────

  Map<String, dynamic> createTrip(Map<String, dynamic> variables) {
    final input = GTripInput.fromJson(
      variables['trip'] as Map<String, dynamic>,
    );
    final id = store.allocateTripId();

    final trip = Trip(
      id: id,
      title: input.title,
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : '',
      date: input.date.isPresent && input.date.requireValue != null
          ? DateTime.parse(input.date.requireValue!)
          : null,
    );

    store.trips[id] = trip;
    store.tripWaypointIds[id] = [];
    store.tripSegmentIds[id] = [];
    store.tripVertexIds[id] = [];

    return GCreateTripData(createTrip: tripFieldsToGql(trip)).toJson();
  }

  Map<String, dynamic> updateTrip(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GTripUpdateInput.fromJson(
      variables['trip'] as Map<String, dynamic>,
    );

    final existing = store.trips[id];
    if (existing == null) throw Exception('Trip introuvable : id=$id');

    final updated = existing.copyWith(
      title: input.title.isPresent && input.title.requireValue != null
          ? input.title.requireValue!
          : existing.title,
      description:
          input.description.isPresent && input.description.requireValue != null
          ? input.description.requireValue!
          : existing.description,
      date: input.date.isPresent
          ? (input.date.requireValue != null
                ? DateTime.parse(input.date.requireValue!)
                : null)
          : existing.date,
    );

    store.trips[id] = updated;
    return GUpdateTripData(updateTrip: tripFieldsToGql(updated)).toJson();
  }

  Map<String, dynamic> deleteTrip(int id) {
    if (!store.trips.containsKey(id))
      throw Exception('Trip introuvable : id=$id');

    // Supprime toutes les entités associées.
    for (final wId in store.tripWaypointIds[id] ?? [])
      store.waypoints.remove(wId);
    for (final sId in store.tripSegmentIds[id] ?? [])
      store.segments.remove(sId);
    for (final vId in store.tripVertexIds[id] ?? []) store.vertices.remove(vId);
    store.tripWaypointIds.remove(id);
    store.tripSegmentIds.remove(id);
    store.tripVertexIds.remove(id);
    store.trips.remove(id);

    return GDeleteTripData(deleteTrip: true).toJson();
  }

  Map<String, dynamic> attachImageToTrip(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final fileKey = variables['fileKey'] as String;

    final trip = store.trips[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    final image = store.carouselItems[fileKey]?.remoteImage;
    if (image == null)
      throw Exception('Image introuvable dans le store : $fileKey');

    if (!trip.images.any((img) => img.fileKey == fileKey)) {
      store.trips[tripId] = trip.copyWith(images: [...trip.images, image]);
    }

    return GAttachImageToTripData(
      attachImageToTrip: GAttachImageToTripData_attachImageToTrip(
        image: imageToGql(image),
      ),
    ).toJson();
  }

  Map<String, dynamic> deleteImageFromTrip(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final fileKey = variables['fileKey'] as String;

    final trip = store.trips[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    store.trips[tripId] = trip.copyWith(
      images: trip.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromTripData(deleteImageFromTrip: fileKey).toJson();
  }
}
