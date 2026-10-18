import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/route/domain/route.dart';
import 'package:trip_application/src/route/domain/route_section.dart';

class RouteStore {
  final GraphNode<RouteFields> route;
  final GraphCollectionStore<RouteSectionFields> sectionStore;

  const RouteStore({required this.route, required this.sectionStore});

  RouteStore.initial(this.route)
    : sectionStore = const GraphCollectionStore<RouteSectionFields>();

  RouteStore copyWith({
    GraphCollectionStore<RouteSectionFields>? sectionStore,
  }) {
    return RouteStore(
      route: route,
      sectionStore: sectionStore ?? this.sectionStore,
    );
  }
}

extension GraphStoreActions on RouteStore {
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
