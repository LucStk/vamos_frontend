import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/route/domain/route.dart';
import 'package:trip_application/src/route/domain/route_section.dart';

class RouteStore {
  final GraphNode<RouteFields>? route;
  final GraphCollectionStore<RouteSectionFields> sectionStore;

  const RouteStore({required this.route, required this.sectionStore});

  const RouteStore.empty()
    : route = null,
      sectionStore = const GraphCollectionStore<RouteSectionFields>();

  /// Monte un store à partir de modèles confirmés par le serveur
  /// (chargement d'un trip). `route == null` : le trip n'a pas de route.
  factory RouteStore.fromRemote({
    RouteRemoteModel? route,
    Iterable<RouteSectionFields> sections = const [],
  }) {
    if (route == null) return const RouteStore.empty();

    return RouteStore(
      route: GraphNode<RouteFields>.initial(route),
      sectionStore: _storeOf(sections),
    );
  }

  /// Après une édition : remplace tout, en gardant la révision du nœud existant.
  RouteStore replacedByServer({
    required RouteRemoteModel remoteRoute,
    required Iterable<RouteSectionFields> remoteSections,
  }) {
    return RouteStore(
      route:
          route?.set(remoteRoute) ??
          GraphNode<RouteFields>.initial(remoteRoute),
      sectionStore: _storeOf(remoteSections),
    );
  }

  static GraphCollectionStore<RouteSectionFields> _storeOf(
    Iterable<RouteSectionFields> sections,
  ) => sections.fold<GraphCollectionStore<RouteSectionFields>>(
    const GraphCollectionStore<RouteSectionFields>(),
    (store, section) => store.setNode(section),
  );

  RouteStore copyWith({
    GraphCollectionStore<RouteSectionFields>? sectionStore,
  }) =>
      RouteStore(route: route, sectionStore: sectionStore ?? this.sectionStore);
}

extension RouteStoreActions on RouteStore {
  RouteStore insertSection(RouteSectionFields segment) {
    return copyWith(sectionStore: sectionStore.insertState(segment));
  }

  RouteStore removeSection(SectionId sId) {
    //topologyIndex.removeEdge(sId);
    return copyWith(sectionStore: sectionStore.remove(sId));
  }

  RouteStore setSection(RouteSectionFields segment) {
    return copyWith(sectionStore: sectionStore.setNode(segment));
  }

  RouteStore rollbackSection(SectionId sId) {
    return copyWith(sectionStore: sectionStore.rollbackNode(sId));
  }

  RouteStore clear() {
    return copyWith(sectionStore: GraphCollectionStore<RouteSectionFields>());
  }
}
