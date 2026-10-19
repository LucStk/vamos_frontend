// route_edit_exceptions_mapper.dart
import 'package:domain_core/domain_core.dart';
import 'package:gql_exec/gql_exec.dart';

import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

Failure? routeEditFailureFromGraphQLErrors(List<GraphQLError> errors) {
  for (final error in errors) {
    final failure = switch (error.extensions?['code']) {
      'STALE_ROUTE' => StaleRouteFailure(),
      'INVALID_ANCHOR' => InvalidRouteAnchorFailure(),
      'INVALID_EDIT' => InvalidRouteEditFailure(),
      'NOT_FOUND' => RouteTripNotFoundFailure(),
      _ => null,
    };
    if (failure != null) return failure;
  }
  return null;
}
