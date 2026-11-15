import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/trip/domain/trip.dart';
import 'package:trip_application/src/waypoint/application/application.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';

mixin WaypointEditor on OptimisticRunner<WaypointStore> {
  WaypointRepository get waypointRepo;
  TripId get tripId;
  Future<Either<Failure, WaypointRemoteModel>> createBlankWaypoint(
    LatLng latLng,
  ) async {
    return await run(
      onApply: (gs) => gs,
      remote: (_) =>
          waypointRepo.createBlankWaypoint(tripId: tripId, latLng: latLng),
      onSuccess: (gs, WaypointRemoteModel serveurValue) =>
          gs.insertWaypoint(serveurValue),
    );
  }

  void patchWaypointPosition(WaypointId waypointId, LatLng latLng) {
    final w = state.waypointStore.getRequired(waypointId);
    final patch = WaypointPatchModel.fromFields(
      w.current,
    ).copyWith(position: latLng);
    state = state.setWaypoint(patch);
  }

  void patchWaypointAnchorPosition(WaypointId waypointId, double position) {
    final w = state.waypointStore.getRequired(waypointId);
    final patch = WaypointPatchModel.fromFields(
      w.current,
    ).copyWith(anchorPosition: position);
    state = state.setWaypoint(patch);
  }

  Future<Either<Failure, WaypointRemoteModel>> updateDescription(
    WaypointFields current,
    String description,
  ) => updateWaypoint(
    WaypointPatchModel.fromFields(current).copyWith(description: description),
  );
  Future<Either<Failure, WaypointRemoteModel>> updateTitle(
    WaypointFields current,
    String title,
  ) => updateWaypoint(
    WaypointPatchModel.fromFields(current).copyWith(title: title),
  );
  Future<Either<Failure, WaypointRemoteModel>> updateWaypoint(
    WaypointFields waypoint,
  ) async {
    final server = state.waypointStore.get(waypoint.id)?.serverValue;
    final changes = WaypointChanges.between(server, waypoint);

    if (changes.isEmpty && server is WaypointRemoteModel) {
      return Right(server);
    }

    return await run(
      entityKey: waypoint.id,
      onApply: (gs) => gs.setWaypoint(waypoint),
      remote: (_) => waypointRepo.updateWaypoint(waypoint, changes),
      onSuccess: (gs, serverValue) => gs.setWaypoint(serverValue),
      onError: (gs, Failure failure) => gs.rollbackWaypoint(waypoint.id),
    );
  }

  Future<Either<Failure, WaypointRemoteModel>> commitWaypoint(
    WaypointId waypointId,
  ) async {
    return await run(
      entityKey: waypointId,
      onApply: (gs) => gs,
      remote: (_) {
        // Lu au moment de l'appel : `current` est un Patch, donc lastRemoteValue
        // est intact et le diff est fiable.
        final node = state.waypointStore.getRequired(waypointId);
        return waypointRepo.updateWaypoint(
          node.current,
          WaypointChanges.between(node.serverValue, node.current),
        );
      },
      onSuccess: (gs, serveurValue) => gs.setWaypoint(serveurValue),
      onError: (gs, Failure failure) => gs.rollbackWaypoint(waypointId),
    );
  }

  Future<Either<Failure, void>> deleteWaypoint(WaypointId id) async {
    return await run(
      entityKey: id,
      onApply: (gs) => gs,
      remote: (_) => waypointRepo.deleteWaypoint(id),
      onSuccess: (gs, _) => gs.removeWaypoint(id),
    );
  }
  // --- Haltes ---------------------------------------------------------------

  /// Crée la halte ou change son nombre de nuits.
  /// Réduire le nombre de nuits supprime les notes des jours retirés :
  /// l'UI doit demander confirmation avant d'appeler.
  Future<Either<Failure, WaypointRemoteModel>> setStay(
    WaypointId waypointId,
    int nights,
  ) {
    return run(
      entityKey: waypointId,
      onApply: (gs) => gs.patchWaypoint(
        waypointId,
        (p) =>
            p.copyWith(stay: (p.stay ?? const StayInfo()).withNights(nights)),
      ),
      remote: (_) => waypointRepo.setStay(waypointId, nights),
      onSuccess: (gs, server) => gs.setWaypoint(server),
      onError: (gs, _) => gs.rollbackWaypoint(waypointId),
    );
  }

  /// Le waypoint n'est plus une halte (ses notes de journée disparaissent).
  Future<Either<Failure, WaypointRemoteModel>> clearStay(
    WaypointId waypointId,
  ) {
    return run(
      entityKey: waypointId,
      onApply: (gs) =>
          gs.patchWaypoint(waypointId, (p) => p.copyWith(stay: null)),
      remote: (_) => waypointRepo.clearStay(waypointId),
      onSuccess: (gs, server) => gs.setWaypoint(server),
      onError: (gs, _) => gs.rollbackWaypoint(waypointId),
    );
  }

  // --- Notes de journée -----------------------------------------------------

  /// Titre et notes du jour `offset` d'une halte. Les deux vides : suppression.
  ///
  /// Même `entityKey` que la halte : si la halte vient d'être créée, cette
  /// opération attend sa réponse et lit alors l'id définitif de la halte.
  Future<Either<Failure, DayNote?>> setStayDayNote(
    WaypointId waypointId,
    int offset, {
    required String title,
    required String notes,
  }) {
    final draft = DayNote(
      offset: offset,
      title: title.trim(),
      notes: notes.trim(),
    );
    return run<DayNote?, WaypointId>(
      entityKey: waypointId,
      onApply: (gs) => gs.patchWaypoint(
        waypointId,
        (p) => p.copyWith(
          stay: p.stay?.withNote(draft.copyWith(stayId: p.stay?.id)),
        ),
      ),
      remote: (_) async {
        // Lu à l'exécution (après les opérations précédentes de la file).
        final stayId = state.waypointStore.get(waypointId)?.current.stay?.id;
        if (stayId == null) {
          return Left(
            NotFoundFailure(
              resourceId: "waypointId",
              resourceType: "stayId pour Waypoint",
            ),
          );
        }
        return waypointRepo.setDayNote(
          tripId: tripId,
          stayId: stayId,
          offset: offset,
          title: draft.title,
          notes: draft.notes,
        );
      },
      onSuccess: (gs, note) => gs.confirmStayNote(waypointId, offset, note),
      onError: (gs, _) => gs.rollbackWaypoint(waypointId),
    );
  }

  /// Titre et notes de la dernière journée (celle qui finit à l'arrivée).
  Future<Either<Failure, DayNote?>> setFinalDayNote({
    required String title,
    required String notes,
  }) {
    final draft = DayNote(offset: 0, title: title.trim(), notes: notes.trim());
    late final DayNote? previous;
    return run<DayNote?, String>(
      entityKey: 'final-day-note:${tripId.value}',
      onApply: (gs) {
        previous = gs.finalDayNote;
        return gs.withFinalDayNote(draft);
      },
      remote: (_) => waypointRepo.setFinalDayNote(
        tripId: tripId,
        offset: 0,
        title: draft.title,
        notes: draft.notes,
      ),
      onSuccess: (gs, note) => gs.withFinalDayNote(note),
      onError: (gs, _) => gs.withFinalDayNote(previous),
    );
  }

  /// À appeler au chargement du trip (avec les waypoints).
  Future<void> loadFinalDayNote() async {
    final result = await waypointRepo.finalDayNote(tripId);
    result.fold((_) {}, (note) => state = state.withFinalDayNote(note));
  }
}
