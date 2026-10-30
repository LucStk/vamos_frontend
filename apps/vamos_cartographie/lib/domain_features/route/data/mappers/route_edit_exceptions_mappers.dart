// route_edit_exceptions_mapper.dart
import 'package:gql_exec/gql_exec.dart';

import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

// route_edit_exceptions_mapper.dart
RouteEditFailure? routeEditFailureFromGraphQLErrors(List<GraphQLError> errors) {
  UnknownRouteEditFailure? unknown;

  for (final error in errors) {
    final code = error.extensions?['code'] as String?;
    print("error ${error.message}");
    final failure = switch (code) {
      'STALE_ROUTE' => StaleRouteFailure(serverMessage: error.message),
      'INVALID_ANCHOR' => InvalidRouteAnchorFailure(
        serverMessage: error.message,
      ),
      'INVALID_EDIT' => InvalidRouteEditFailure(serverMessage: error.message),
      'NOT_FOUND' => RouteTripNotFoundFailure(serverMessage: error.message),
      _ => null,
    };
    if (failure != null) return failure; // un code connu prime sur un inconnu

    unknown ??= UnknownRouteEditFailure(
      code: code,
      serverMessage: error.message,
    );
  }
  return unknown; // null seulement si `errors` est vide
}
