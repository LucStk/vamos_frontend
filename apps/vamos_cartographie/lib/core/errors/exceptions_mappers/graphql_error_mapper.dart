import 'package:domain_core/domain_core.dart';
import 'package:gql_exec/gql_exec.dart';

import 'package:vamos_cartographie/core/errors/server_failures.dart';

typedef GraphQLErrorsMapper = Failure? Function(List<GraphQLError> errors);

Failure graphqlExceptionsMappers(List<GraphQLError> errors) {
  final error = errors.first;

  return switch (error.extensions?['code']) {
    'NOT_FOUND' => NotFoundFailure(),
    _ => ServerFailure(error.message),
  };
}
