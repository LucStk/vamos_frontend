import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/waypoint/domain/domain.dart';
import 'package:trip_application/src/waypoint/domain/stay_model.dart';

class WaypointStore {
  final GraphCollectionStore<WaypointFields> waypointStore;

  /// Notes de la dernière journée (celle qui finit à l'arrivée), ou null.
  /// À part : elle n'appartient à aucun waypoint.
  final DayNote? finalDayNote;

  const WaypointStore({required this.waypointStore, this.finalDayNote});

  const WaypointStore.initial()
    : waypointStore = const GraphCollectionStore<WaypointFields>(),
      finalDayNote = null;

  /// Monte un store à partir de modèles confirmés par le serveur
  /// (chargement d'un trip).
  factory WaypointStore.fromRemote(
    Iterable<WaypointFields> waypoints, {
    DayNote? finalDayNote,
  }) {
    return WaypointStore(
      waypointStore: _storeOf(waypoints),
      finalDayNote: finalDayNote,
    );
  }

  /// Remplace tous les waypoints par ceux renvoyés par le serveur.
  /// Les waypoints absents de `waypoints` disparaissent du store.
  /// La note de dernière journée n'est pas concernée.
  WaypointStore replacedByServer(Iterable<WaypointFields> waypoints) {
    return copyWith(waypointStore: _storeOf(waypoints));
  }

  static GraphCollectionStore<WaypointFields> _storeOf(
    Iterable<WaypointFields> waypoints,
  ) => waypoints.fold<GraphCollectionStore<WaypointFields>>(
    const GraphCollectionStore<WaypointFields>(),
    (store, waypoint) => store.replaceState(waypoint),
  );

  WaypointStore copyWith({
    GraphCollectionStore<WaypointFields>? waypointStore,
  }) {
    return WaypointStore(
      waypointStore: waypointStore ?? this.waypointStore,
      finalDayNote: finalDayNote,
    );
  }

  /// Séparé de [copyWith] : ici, null est une valeur légitime (pas de note).
  WaypointStore withFinalDayNote(DayNote? note) => WaypointStore(
    waypointStore: waypointStore,
    finalDayNote: (note == null || note.isEmpty) ? null : note,
  );
}

extension WaypointStoreActions on WaypointStore {
  WaypointStore insertWaypoint(WaypointFields state) {
    return copyWith(waypointStore: waypointStore.insertState(state));
  }

  WaypointStore removeWaypoint(WaypointId id) {
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  WaypointStore setWaypoint(WaypointFields serverWaypoint) {
    return copyWith(waypointStore: waypointStore.setNode(serverWaypoint));
  }

  WaypointStore rollbackWaypoint(WaypointId wid) =>
      copyWith(waypointStore: waypointStore.rollbackNode(wid));

  /// Applique une modification optimiste à la valeur COURANTE du waypoint
  /// (pas à une copie potentiellement périmée tenue par un widget).
  /// Null si le waypoint n'est pas dans le store.
  WaypointStore? patchWaypoint(
    WaypointId id,
    WaypointPatchModel Function(WaypointPatchModel p) edit,
  ) {
    final current = waypointStore.get(id)?.current;
    if (current == null) return null;
    return setWaypoint(edit(WaypointPatchModel.fromFields(current)));
  }

  /// Confirme la note renvoyée par le serveur dans la dernière valeur serveur
  /// du waypoint. `note` null = note supprimée côté serveur.
  WaypointStore? confirmStayNote(WaypointId id, int offset, DayNote? note) {
    final server = waypointStore.get(id)?.serverValue;
    if (server is! WaypointRemoteModel || server.stay == null) return null;
    final stay = server.stay!;
    final confirmed = stay.withNote(
      note ?? DayNote(stayId: stay.id, offset: offset),
    );
    return setWaypoint(server.copyWith(stay: confirmed));
  }

  WaypointStore clear() {
    return WaypointStore(
      waypointStore: const GraphCollectionStore<WaypointFields>(),
    );
  }
}
