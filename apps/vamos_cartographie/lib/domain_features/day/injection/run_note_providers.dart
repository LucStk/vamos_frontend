import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/injection/client_provider.dart';
import 'package:vamos_cartographie/domain_features/day/data/run_note_remote_datasource.dart';
import 'package:vamos_cartographie/domain_features/day/domain/run_note.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';

// Providers écrits à la main (pas de génération) : le code qui les utilise
// compile sans relancer build_runner pour eux.

final runNoteRemoteDatasourceProvider = Provider<RunNoteRemoteDatasource>(
  (ref) => RunNoteRemoteDatasource(ref.watch(clientProvider)),
);

/// Haltes du trip, par leur waypoint. Change quand une halte apparaît ou
/// disparaît : les notes de morceau se fusionnent alors côté serveur.
final _stayWaypointIdsProvider = Provider.autoDispose
    .family<List<WaypointId>, TripId>((ref, tripId) {
      return [
        for (final id in ref.watch(allWaypointIdsProvider(tripId)))
          if (ref.watch(
            waypointProvider(tripId, id).select((w) => w.stay != null),
          ))
            id,
      ];
    });

/// Notes de tous les morceaux du trip. Rechargées quand les haltes changent.
final runNotesProvider = FutureProvider.autoDispose
    .family<List<RunNote>, TripId>((ref, tripId) {
      ref.watch(_stayWaypointIdsProvider(tripId));
      return ref
          .watch(runNoteRemoteDatasourceProvider)
          .runNotes(tripId: tripId);
    });

/// Un morceau : la journée qui finit à la halte [endsAt] (null : la dernière)
/// et le span.
typedef RunKey = ({TripId tripId, WaypointId? endsAt, SpanId spanId});

/// La note d'un morceau, ou null s'il n'en a pas.
final runNoteProvider = Provider.autoDispose.family<RunNote?, RunKey>((
  ref,
  key,
) {
  final stayId = ref.watch(_stayIdProvider((key.tripId, key.endsAt)));
  // Halte pas encore connue du serveur : aucune note.
  if (key.endsAt != null && stayId == null) return null;
  final notes = ref.watch(runNotesProvider(key.tripId)).value ?? const [];
  for (final n in notes) {
    if (n.spanId == key.spanId && n.stayId == stayId) return n;
  }
  return null;
});

/// Halte qui termine la journée ; null pour la dernière journée (et tant que
/// le serveur n'a pas donné d'id à une halte créée à l'instant).
final _stayIdProvider = Provider.autoDispose
    .family<StayId?, (TripId, WaypointId?)>((ref, key) {
      final (tripId, endsAt) = key;
      if (endsAt == null) return null;
      return ref.watch(
        waypointProvider(tripId, endsAt).select((w) => w.stay?.id),
      );
    });

/// Enregistre la note d'un morceau, puis recharge les notes du trip.
Future<Either<Failure, void>> saveRunNote(
  WidgetRef ref,
  RunKey key, {
  required String title,
  required String notes,
}) async {
  final stayId = ref.read(_stayIdProvider((key.tripId, key.endsAt)));
  if (key.endsAt != null && stayId == null) {
    // La halte vient d'être créée : le serveur ne la connaît pas encore.
    return Left(
      NotFoundFailure(resourceType: 'Stay', resourceId: '${key.endsAt}'),
    );
  }
  final remote = ref.read(runNoteRemoteDatasourceProvider);
  final result = await guard(
    () => remote.setRunNote(
      tripId: key.tripId,
      stayId: stayId,
      spanId: key.spanId,
      title: title,
      notes: notes,
    ),
  );
  if (result.isRight()) ref.invalidate(runNotesProvider(key.tripId));
  return result.map((_) {});
}
