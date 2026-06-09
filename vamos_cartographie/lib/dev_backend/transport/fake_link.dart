import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart'; // 1. On l'importe NORMALEMENT (sans alias)
import 'package:ferry/ferry.dart'
    hide Response; // 2. On CACHE le Response de Ferry !
import 'package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart';

import "package:vamos_cartographie/dev_backend/resolvers/resolvers.dart";

class FakeGraphQLLink extends Link {
  late TopologyResolver topologyResolver;
  late TripResolver tripResolver;
  late WaypointResolver waypointResolver;
  late MediaResolver mediaResolver;

  FakeGraphQLLink(FakeGraphQLStore store) {
    topologyResolver = TopologyResolver(store);
    tripResolver = TripResolver(store);
    waypointResolver = WaypointResolver(store);
    mediaResolver = MediaResolver(store);
  }
  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final operationName = request.operation.operationName ?? "";

    try {
      // Recherche en cascade parmi l'ensemble des résolveurs du backend mocké
      final handler =
          topologyResolver.mockHandlers[operationName] ??
          tripResolver.mockHandlers[operationName] ??
          waypointResolver.mockHandlers[operationName] ??
          mediaResolver.mockHandlers[operationName];

      if (handler == null) {
        throw UnimplementedError(
          'Opération mockée non gérée globalement : $operationName',
        );
      }

      return Stream.value(
        Response(response: const {}, data: handler(request.variables)),
      );
    } catch (e) {
      return Stream.value(
        Response(
          response: const {},
          errors: [GraphQLError(message: e.toString())],
        ),
      );
    }
  }
}
