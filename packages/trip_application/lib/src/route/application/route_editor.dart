import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/domain/route_repository.dart';
import 'package:trip_application/src/trip/domain/domain.dart';

mixin RouteEditor on OptimisticRunner<RouteEditor> {
  // On définit les dépendances sous forme de getters abstraits
  TripId get tripId;
  RouteRepository get routeRepo;

  Future<Either<Failure, CreateSegmentPayload>> createSegment({
    required List<LatLng> geometry,
    required MobilityType mobilityType,
  }) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => segmentRepo.createSegment(
        tripId: tripId,
        mobilityType: mobilityType,
        geometry: geometry,
      ),
      onSuccess: (gs, serveurValue) {
        gs = gs.insertSegment(serveurValue.segment);
        return gs;
      },
      onError: (gs, Failure failure) {
        print("error create segment $failure");
        return gs;
      },
    );
  }

  Future<Either<Failure, RouteSectionRemoteModel>> updateSegment(
    RouteSectionPatchModel segment,
  ) async {
    return await run(
      onApply: (gs) => gs.setSegment(segment),
      remote: (_) => segmentRepo.updateSegment(segment),
      onSuccess: (gs, serveurValue) => gs.setSegment(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackSegment(segment.id),
    );
  }

  Future<Either<Failure, RouteSectionRemoteModel>> correctSegment(
    RouteSectionPatchModel patchSegment,
    List<LatLng> correction,
  ) async {
    return await run(
      onApply: (gs) => gs.setSegment(patchSegment),
      remote: (_) => segmentRepo.correctSegment(patchSegment.id, correction),
      onSuccess: (gs, serveurValue) => gs.setSegment(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackSegment(patchSegment.id),
    );
  }

  Future<Either<Failure, (List<SectionId>, RouteSectionRemoteModel)>>
  spliceSegment({
    required List<LatLng> correction,
    required MobilityType mobilityType,
    required SpliceAnchor startAnchor,
    required SpliceAnchor endAnchor,
  }) async {
    return await run(
      onApply: (gs) => gs, //.setSegment(patchSegment),
      remote: (_) => segmentRepo.spliceSegment(
        tripId: tripId,
        correction: correction,
        mobilityType: mobilityType,
        startAnchor: startAnchor,
        endAnchor: endAnchor,
      ),
      onSuccess: (gs, serveurValue) {
        final (listSegmentId, segment) = serveurValue;
        gs = gs.insertSegment(segment);
        for (SectionId i in listSegmentId) {
          gs = gs.removeSegment(i);
        }
        return gs;
      },
      onError: (gs, Failure failure) => gs, //.rollbackSegment(patchSegment.id),
    );
  }

  Future<Either<Failure, void>> deleteSegment(SectionId segId) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => segmentRepo.deleteSegment(segId),
      onSuccess: (gs, _) => gs.removeSegment(segId),
    );
  }
}
