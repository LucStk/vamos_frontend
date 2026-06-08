import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';
import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/mapping/gql_mappers.dart";

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
    final trips = store.tripsMap.values.map(tripFieldsToGql).toList();
    return GGetAllTripsData(trips: trips).toJson();
  }

  Map<String, dynamic> getTrip(int id) {
    final base = store.tripsMap[id];
    if (base == null) throw Exception('Trip introuvable : id=$id');

    final waypoints = store.waypoints(id).map((w) {
      final v = store.vertex(w.vertexId);
      return waypointToGql(w, v);
    }).toList();

    final segments = store.segments(id).map((s) {
      return segmentToGql(
        s,
        store.vertex(s.startVertexId),
        store.vertex(s.endVertexId),
      );
    }).toList();

    final vertices = store.vertices(id).map(vertexToGql).toList();

    return GGetTripData(
      trip: GTripFieldsData(
        id: base.id,
        title: base.title,
        description: base.description,
        date: base.date?.toIso8601String().substring(0, 10),
        images: base.images
            .map((img) => GGetTripData_trip_images(image: imageToGql(img)))
            .toList(),
      ),
    ).toJson();
  }

  // ── Mutations ─────────────────────────────────────────────────────────────────

  Map<String, dynamic> createTrip(Map<String, dynamic> variables) {
    final input = GTripInput.fromJson(
      variables['trip'] as Map<String, dynamic>,
    );
    final id = store.nextTripId.next();

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

    store.addTrip(trip);

    return GCreateTripData(createTrip: tripFieldsToGql(trip)).toJson();
  }

  Map<String, dynamic> updateTrip(Map<String, dynamic> variables) {
    final id = variables['id'] as int;
    final input = GTripUpdateInput.fromJson(
      variables['trip'] as Map<String, dynamic>,
    );

    final existing = store.tripsMap[id];
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

    store.tripsMap[id] = updated;
    return GUpdateTripData(updateTrip: tripFieldsToGql(updated)).toJson();
  }

  Map<String, dynamic> deleteTrip(int id) {
    store.removeTrip(id);
    return GDeleteTripData(deleteTrip: true).toJson();
  }

  Map<String, dynamic> attachImageToTrip(Map<String, dynamic> variables) {
    final tripId = variables['tripId'] as int;
    final fileKey = variables['fileKey'] as String;

    final trip = store.tripsMap[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    final image = store.carouselItems[fileKey]?.remoteImage;
    if (image == null) {
      throw Exception('Image introuvable dans le store : $fileKey');
    }

    if (!trip.images.any((img) => img.fileKey == fileKey)) {
      store.tripsMap[tripId] = trip.copyWith(images: [...trip.images, image]);
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

    final trip = store.tripsMap[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    store.tripsMap[tripId] = trip.copyWith(
      images: trip.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromTripData(deleteImageFromTrip: fileKey).toJson();
  }
}
