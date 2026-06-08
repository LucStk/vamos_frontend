class GraphQLFakeException implements Exception {
  final String message;

  const GraphQLFakeException(this.message);

  @override
  String toString() => 'GraphQLFakeException: $message';
}
