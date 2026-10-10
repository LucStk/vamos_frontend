import 'package:domain_core/domain_core.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';
part 'map_trip_object.g.dart';

@riverpod
MapTripObject mapTripObject(Ref ref, TripId tripId) {
  final trip = ref.watch(tripProvider(tripId));
  if (trip == null) {
    throw NotFoundFailure(resourceId: tripId.toString(), resourceType: "Trip");
  }
  final tripSegment = ref.watch(allSegmentsProvider(tripId));
  // Applique la projection et l'aplatissement directement avec expand
  final tripGeometry = tripSegment.map((s) => s.geometry).toList();
  return MapTripObject(trip.id, tripGeometry);
}
