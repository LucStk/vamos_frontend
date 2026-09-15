import 'package:domain_core/failures/failures.dart';
import 'package:gql_exec/gql_exec.dart';

Failure graphqlExceptionsMappers(List<GraphQLError> errors) {
  final error = errors.first;
  final code = error.extensions?['code'];

  return switch (code) {
    'AUTHENTICATION_REQUIRED' ||
    'INVALID_TOKEN' ||
    'TOKEN_EXPIRED' => AuthenticationFailure(message: error.message),
    'NOT_FOUND' => const NotFoundFailure(),
    _ => ServerFailure(error.message),
  };
}
