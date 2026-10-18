import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';

abstract class RouteRepository {
  //   Future<Either<Failure, RouteSectionRemoteModel>> updateSegment(
  //     RouteSectionFields segment,
  //   );
  //   Future<Either<Failure, RouteSectionRemoteModel>> correctSegment(
  //     SectionId segmentId,
  //     List<LatLng> correction,
  //   );
  //
  //   Future<Either<Failure, CreateSegmentPayload>> createSegment({
  //     required Id<Trip> tripId,
  //     required MobilityType mobilityType,
  //     required List<LatLng> geometry,
  //   });
  //   Future<Either<Failure, RefineSegmentPayload>> refineSegment(
  //     SectionId segmentId,
  //   );
  //   Future<Either<Failure, (List<SectionId>, RouteSectionRemoteModel)>>
  //   spliceSegment({
  //     required TripId tripId,
  //     required List<LatLng> correction,
  //     required MobilityType mobilityType,
  //     required SpliceAnchor startAnchor,
  //     required SpliceAnchor endAnchor,
  //   });
  //   Future<Either<Failure, void>> deleteSegment(SectionId id);
  //   Future<Either<Failure, List<RouteSectionRemoteModel>>> getSegments(
  //     TripId tripId,
  //   );
}
