import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'graph_store.dart';

import 'package:trip_application/trip/domain/trip.dart';
import '/topology/domain/domain.dart';

mixin GraphEditor on OptimisticRunner<GraphStore> {
  // On définit les dépendances sous forme de getters abstraits
  TripId get tripId;
  SegmentRepository get segmentRepo;
  VertexRepository get vertexRepo;

  Future<Either<Failure, (SegmentRemoteModel, VertexRemoteModel)>>
  createSegment({
    required VertexId startVertexId,
    VertexId? endVertexId,
    required List<LatLng> geometry,
    required MobilityType mobilityType,
  }) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => segmentRepo.createSegment(
        tripId: tripId,
        startVertexId: startVertexId,
        endVertexId: endVertexId,
        mobilityType: mobilityType,
        geometry: geometry,
      ),
      onSuccess: (gs, serveurValue) {
        final (segment, vertex) = serveurValue;
        gs.insertSegment(segment);
        if (endVertexId == null) {
          gs.insertVertex(vertex);
        }
      },
    );
  }

  Future<Either<Failure, SegmentRemoteModel>> updateSegment(
    SegmentPatchModel segment,
  ) async {
    return await run(
      onApply: (gs) => gs.setSegment(segment),
      remote: (_) => segmentRepo.updateSegment(segment),
      onSuccess: (gs, serveurValue) => gs.setSegment(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackSegment(segment.id),
    );
  }

  Future<Either<Failure, SegmentRemoteModel>> correctSegment(
    SegmentPatchModel patchSegment,
    List<LatLng> correction,
  ) async {
    return await run(
      onApply: (gs) => gs.setSegment(patchSegment),
      remote: (_) => segmentRepo.correctSegment(patchSegment.id, correction),
      onSuccess: (gs, serveurValue) => gs.setSegment(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackSegment(patchSegment.id),
    );
  }

  Future<Either<Failure, void>> deleteSegment(SegmentId segId) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => segmentRepo.deleteSegment(segId),
      onSuccess: (gs, _) => gs.removeSegment(segId),
    );
  }

  Future<Either<Failure, VertexRemoteModel>> createSimpleVertex(
    LatLng latLng,
  ) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => vertexRepo.createVertex(tripId, latLng),
      onSuccess: (gs, VertexRemoteModel serveurValue) =>
          gs.insertVertex(serveurValue),
    );
  }

  Future<Either<Failure, VertexRemoteModel>> moveVertex(
    VertexId vid,
    LatLng latLng,
  ) async {
    return await run(
      onApply: (gs) => gs.setVertex(VertexPatchModel(id: vid, latLng: latLng)),
      remote: (_) => vertexRepo.moveVertex(VertexId(vid.value), latLng),
      onSuccess: (gs, VertexRemoteModel serveurValue) =>
          gs.setVertex(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackVertex(vid),
    );
  }

  Future<Either<Failure, void>> removeVertex(VertexId vid) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) => vertexRepo.deleteVertex(VertexId(vid.value)),
      onSuccess: (gs, _) => gs.removeVertex(VertexId(vid.value)),
    );
  }
}
