import '../executor/graphql_executor.dart';
import '../registry/resolver_registry.dart';
import '../traversal/ast_traverser.dart';
import '../traversal/selection_set_parser.dart';

import '../../resolvers/trip_resolver.dart';
import '../../resolvers/waypoint_resolver.dart';
import '../../resolvers/topology_resolver.dart';
import '../../resolvers/media_resolver.dart';

import '../../core/fake_graphql_store.dart';

class FakeBackendBootstrap {
  final FakeGraphQLStore store;

  late final ResolverRegistry registry;
  late final GraphQLExecutor executor;

  FakeBackendBootstrap(this.store) {
    registry = ResolverRegistry();

    // register resolvers
    registry.register('GetAllTrips', TripResolver(store));
    registry.register('GetTrip', TripResolver(store));
    registry.register('CreateTrip', TripResolver(store));
    registry.register('UpdateTrip', TripResolver(store));
    registry.register('DeleteTrip', TripResolver(store));

    registry.register('GetWaypoints', WaypointResolver(store));
    registry.register('CreateWaypoint', WaypointResolver(store));
    registry.register('UpdateWaypoint', WaypointResolver(store));

    registry.register('GetSegments', TopologyResolver(store));
    registry.register('GetVertices', TopologyResolver(store));

    registry.register('GenerateImageUploadUrl', MediaResolver(store));

    executor = GraphQLExecutor(
      registry: registry,
      traverser: AstTraverser(SelectionSetParser()),
    );
  }
}
