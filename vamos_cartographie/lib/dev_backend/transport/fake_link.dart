import 'package:gql_exec/gql_exec.dart';
import 'package:ferry/ferry.dart' show Link, NextLink;

import "package:vamos_cartographie/dev_backend/resolvers/resolvers.dart";

import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import 'package:gql_exec/gql_exec.dart';
import '../ast/bootstrap/fake_backend_bootstrap.dart';

class FakeLink extends Link {
  final FakeBackendBootstrap backend;

  FakeLink(this.backend);

  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    try {
      final data = backend.executor.execute(
        operationName: request.operation.operationName!,
        variables: request.variables,
        selectionSet: request.context
            .entry<GraphQLRequestContext>()
            ?.document
            ?.definitions
            .first, // simplification volontaire
      );

      return Stream.value(Response(data: data, response: const {}));
    } catch (e) {
      return Stream.value(
        Response(
          errors: [GraphQLError(message: e.toString())],
          response: const {},
        ),
      );
    }
  }
}
