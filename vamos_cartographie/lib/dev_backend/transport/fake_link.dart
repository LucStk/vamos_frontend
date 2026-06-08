import 'package:gql_link/gql_link.dart';
import 'package:gql_exec/gql_exec.dart'; // 1. On l'importe NORMALEMENT (sans alias)
import 'package:ferry/ferry.dart'
    hide Response; // 2. On CACHE le Response de Ferry !

import "package:vamos_cartographie/dev_backend/resolvers/resolvers.dart";
import "package:vamos_cartographie/graphql/graphql.dart";

class FakeGraphQLLink extends Link {
  final TopologyResolver topologyResolver;

  FakeGraphQLLink(this.topologyResolver);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    final operationName = request.operation.operationName;

    try {
      switch (operationName) {
        case "GetTopology":
          {
            final vars = GGetTopologyVars.fromJson(request.variables);
            return Stream.value(
              Response(
                response: const {},
                data: topologyResolver.getTopology(vars).toJson(),
              ),
            );
          }
        case "CreateVertex":
          {
            final vars = GCreateVertexVars.fromJson(request.variables);
            return Stream.value(
              Response(
                response: const {},
                data: topologyResolver.createVertex(vars).toJson(),
              ),
            );
          }
        default:
          throw UnimplementedError(
            'Opération mockée non gérée : $operationName',
          );
      }
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
