import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import "package:vamos_cartographie/backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/backend/mapping/gql_mappers.dart";

/// Résout les opérations GraphQL relatives aux trips.
class TripResolver {
  final FakeGraphQLStore store;

  /// Table de correspondance qui associe chaque nom d'opération GraphQL
  /// à sa fonction de traitement (désérialisation -> exécution -> JSON).
  late final Map<String, Map<String, dynamic>? Function(Map<String, dynamic>?)>
  mockHandlers;

  TripResolver(this.store) {
    _initHandlers();
  }

  void _initHandlers() {
    mockHandlers = {
      // Queries
      "GetAllTrips": (_) => getAllTrips().toJson(),
      "GetTrip": (raw) =>
          getTrip(GGetTripVars.fromJson(raw ?? const {})).toJson(),

      // Mutations
      "CreateTrip": (raw) =>
          createTrip(GCreateTripVars.fromJson(raw ?? const {})).toJson(),
      "UpdateTrip": (raw) =>
          updateTrip(GUpdateTripVars.fromJson(raw ?? const {})).toJson(),
      "DeleteTrip": (raw) =>
          deleteTrip(GDeleteTripVars.fromJson(raw ?? const {})).toJson(),
      "AttachImageToTrip": (raw) => attachImageToTrip(
        GAttachImageToTripVars.fromJson(raw ?? const {}),
      ).toJson(),
      "DeleteImageFromTrip": (raw) => deleteImageFromTrip(
        GDeleteImageFromTripVars.fromJson(raw ?? const {}),
      ).toJson(),
    };
  }

  // ── Queries ──────────────────────────────────────────────────────────────────

  GGetAllTripsData getAllTrips() {
    final trips = store.tripsMap.values.map(tripFieldsToGql).toList();
    return GGetAllTripsData(trips: trips);
  }

  GGetTripData getTrip(GGetTripVars vars) {
    final base = store.tripsMap[Id<Trip>(vars.id)];
    if (base == null) throw Exception('Trip introuvable : id=${vars.id}');

    return GGetTripData(
      trip: GTripFieldsData(
        id: base.id.value,
        title: base.title,
        description: base.description,
        date: base.date?.toIso8601String().substring(0, 10),
        images: base.images
            .map((img) => GTripFieldsData_images(image: imageToGql(img)))
            .toList(),
      ),
    );
  }

  // ── Mutations ─────────────────────────────────────────────────────────────────

  GCreateTripData createTrip(GCreateTripVars vars) {
    final GTripInput input = vars.trip;
    final id = store.nextTripId.next();

    final trip = Trip(
      id: Id<Trip>(id),
      title: input.title,
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : '',
      date: input.date.isPresent && input.date.requireValue != null
          ? DateTime.parse(input.date.requireValue!)
          : null,
    );

    store.addTrip(trip);

    return GCreateTripData(createTrip: tripFieldsToGql(trip));
  }

  GUpdateTripData updateTrip(GUpdateTripVars vars) {
    final Id<Trip> id = Id<Trip>(vars.id);
    final GTripUpdateInput input = vars.trip;

    final existing = store.tripsMap[id];
    if (existing == null) throw Exception('Trip introuvable : id=$id');

    final updated = existing.copyWith(
      title: input.title.isPresent
          ? (input.title.requireValue ?? existing.title)
          : existing.title,
      description: input.description.isPresent
          ? (input.description.requireValue ?? '')
          : existing.description,
      date: input.date.isPresent
          ? (input.date.requireValue != null
                ? DateTime.parse(input.date.requireValue!)
                : null)
          : existing.date,
    );

    store.tripsMap[id] = updated;
    return GUpdateTripData(updateTrip: tripFieldsToGql(updated));
  }

  GDeleteTripData deleteTrip(GDeleteTripVars vars) {
    store.removeTrip(Id<Trip>(vars.id));
    return GDeleteTripData(deleteTrip: true);
  }

  GAttachImageToTripData attachImageToTrip(GAttachImageToTripVars vars) {
    final Id<Trip> tripId = Id<Trip>(vars.tripId);
    final String fileKey = vars.fileKey;

    final trip = store.tripsMap[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    final image = store.getMediaImage(fileKey);

    if (!trip.images.any((img) => img.fileKey == fileKey)) {
      store.tripsMap[tripId] = trip.copyWith(images: [...trip.images, image]);
    }

    return GAttachImageToTripData(
      attachImageToTrip: GAttachImageToTripData_attachImageToTrip(
        image: imageToGql(image),
      ),
    );
  }

  GDeleteImageFromTripData deleteImageFromTrip(GDeleteImageFromTripVars vars) {
    final String fileKey = vars.fileKey;

    final Id<Trip> tripId = Id<Trip>(vars.tripId);
    final trip = store.tripsMap[tripId];
    if (trip == null) throw Exception('Trip introuvable : id=$tripId');

    store.tripsMap[tripId] = trip.copyWith(
      images: trip.images.where((img) => img.fileKey != fileKey).toList(),
    );

    return GDeleteImageFromTripData(deleteImageFromTrip: fileKey);
  }
}
