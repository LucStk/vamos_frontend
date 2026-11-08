import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/route/domain/route.dart';
import 'package:trip_application/src/route/domain/spans/spans.dart';

/// La route d'un trip et ses calques, dans UNE seule valeur immuable.
///
/// Les `startIndex` de tous les calques sont des indices dans `route` : ils ne
/// sont cohérents qu'ensemble. D'où un seul store, remplacé d'un bloc par le
/// serveur, plutôt qu'un store par calque qui pourrait exposer une route à la
/// version N et un calque à la version N-1.
class RouteStore {
  final GraphNode<RouteFields>? route;

  /// Calque modalité. Modifiable de façon optimiste (modalité, recalcul) :
  /// d'où les nœuds révisés de GraphCollectionStore.
  final GraphCollectionStore<MobilitySpanFields> mobilitySpans;

  /// Calque d'édition. Jamais modifié côté client, remplacé en bloc par le
  /// serveur : une liste suffit, triée par `startIndex` dès la construction.
  final List<EditSpan> editSpans;

  const RouteStore({
    required this.route,
    required this.mobilitySpans,
    required this.editSpans,
  });

  const RouteStore.empty()
    : route = null,
      mobilitySpans = const GraphCollectionStore<MobilitySpanFields>(),
      editSpans = const [];

  /// Monte un store à partir de modèles confirmés par le serveur
  /// (chargement d'un trip). `route == null` : le trip n'a pas de route.
  factory RouteStore.fromRemote({
    RouteRemoteModel? route,
    Iterable<MobilitySpanFields> mobilitySpans = const [],
    Iterable<EditSpan> editSpans = const [],
  }) {
    if (route == null) return const RouteStore.empty();
    return RouteStore(
      route: GraphNode<RouteFields>.initial(route),
      mobilitySpans: _upsertMobility(
        const GraphCollectionStore<MobilitySpanFields>(),
        mobilitySpans,
      ),
      editSpans: _sortedEdits(editSpans),
    );
  }

  RouteStore withRoute(GraphNode<RouteFields>? route) => RouteStore(
    route: route,
    mobilitySpans: mobilitySpans,
    editSpans: editSpans,
  );

  /// Après une édition : remplace la route et TOUS ses calques d'un coup, en
  /// gardant la révision des nœuds existants.
  RouteStore replacedByServer({
    required RouteRemoteModel remoteRoute,
    required Iterable<MobilitySpanFields> remoteMobilitySpans,
    required Iterable<EditSpan> remoteEditSpans,
  }) {
    return RouteStore(
      route:
          route?.set(remoteRoute) ??
          GraphNode<RouteFields>.initial(remoteRoute),
      mobilitySpans: _upsertMobility(mobilitySpans, remoteMobilitySpans),
      editSpans: _sortedEdits(remoteEditSpans),
    );
  }

  /// Reconstruit la collection depuis le serveur. Un span absent de la réponse
  /// disparaît (fusionné ou remplacé côté serveur) ; un span connu garde sa
  /// révision ; un nouveau span part d'un nœud initial.
  static GraphCollectionStore<MobilitySpanFields> _upsertMobility(
    GraphCollectionStore<MobilitySpanFields> previous,
    Iterable<MobilitySpanFields> remote,
  ) => remote.fold(const GraphCollectionStore<MobilitySpanFields>(), (
    acc,
    span,
  ) {
    final existing = previous.get(span.id);
    return acc.replaceNode(
      existing?.set(span) ?? GraphNode<MobilitySpanFields>.initial(span),
    );
  });

  static List<EditSpan> _sortedEdits(Iterable<EditSpan> spans) =>
      List.unmodifiable(
        [...spans]..sort((a, b) => a.startIndex.compareTo(b.startIndex)),
      );

  RouteStore copyWith({
    GraphCollectionStore<MobilitySpanFields>? mobilitySpans,
  }) => RouteStore(
    route: route,
    mobilitySpans: mobilitySpans ?? this.mobilitySpans,
    editSpans: editSpans,
  );
}

/// Modifications optimistes. Seul le calque modalité en a : créer ou supprimer
/// un span est toujours une décision du serveur (découpe, fusion), qui revient
/// par `replacedByServer`.
extension RouteStoreActions on RouteStore {
  /// Changement de modalité ou marquage « recalcul en cours ». Ne touche
  /// jamais `startIndex` : l'ordre des spans ne bouge pas.
  RouteStore setMobilitySpan(MobilitySpanFields span) =>
      copyWith(mobilitySpans: mobilitySpans.setNode(span));

  RouteStore rollbackMobilitySpan(MobilitySpanId id) =>
      copyWith(mobilitySpans: mobilitySpans.rollbackNode(id));

  RouteStore patchRoute(RoutePatchModel value) =>
      withRoute(route?.set(value) ?? GraphNode<RouteFields>.initial(value));

  /// Annule un patch. Un nœud jamais confirmé par le serveur disparaît,
  /// car GraphNode.rollback() le laisserait tel quel.
  RouteStore rollbackRoute() {
    final node = route;
    if (node == null) return this;
    return withRoute(node.isPendingCreation ? null : node.rollback());
  }
}
