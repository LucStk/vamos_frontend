import 'package:domain_core/domain_core.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/network/ferry_client_x.dart';
import 'package:vamos_cartographie/domain_features/day/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/day/domain/run_note.dart';

extension GRunNoteDetailsMapper on GRunNoteDetails {
  RunNote toDomain() => RunNote(
    stayId: stayId == null ? null : StayId(stayId!),
    spanId: SpanId(spanId),
    title: title,
    notes: notes,
  );
}

/// Notes des morceaux de journée, côté serveur.
class RunNoteRemoteDatasource {
  RunNoteRemoteDatasource(this.ferryClient);

  final Client ferryClient;

  /// Les notes de tous les morceaux du trip.
  Future<List<RunNote>> runNotes({required Id<Trip> tripId}) async {
    final data = await ferryClient.execute(
      GRunNotesReq(vars: GRunNotesVars(tripId: tripId.value)),
    );
    return [for (final n in data.runNotes) n.toDomain()];
  }

  /// Renvoie null si la note a été supprimée (titre et notes vides).
  Future<RunNote?> setRunNote({
    required Id<Trip> tripId,
    required StayId? stayId,
    required SpanId spanId,
    required String title,
    required String notes,
  }) async {
    final data = await ferryClient.execute(
      GSetRunNoteReq(
        vars: GSetRunNoteVars(
          tripId: tripId.value,
          spanId: spanId.value,
          stayId: Value.present(stayId?.value),
          title: title,
          notes: notes,
        ),
      ),
    );
    return data.setRunNote?.toDomain();
  }
}
