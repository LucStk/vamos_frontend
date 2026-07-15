// core/error/graphql_request_exception.dart
import 'package:gql_exec/gql_exec.dart' show GraphQLError;
import 'package:gql_link/gql_link.dart' show LinkException;

class GraphQLRequestException implements Exception {
  final LinkException? linkException;
  final List<GraphQLError> graphqlErrors;

  GraphQLRequestException({this.linkException, this.graphqlErrors = const []});

  @override
  String toString() =>
      'GraphQLRequestException(link: $linkException, errors: $graphqlErrors)';
}
