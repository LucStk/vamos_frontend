import '../executor/selection_resolver.dart';

class ResolverRegistry {
  final Map<String, SelectionResolver> _resolvers = {};

  void register(String operationName, SelectionResolver resolver) {
    _resolvers[operationName] = resolver;
  }

  SelectionResolver resolve(String operationName) {
    final resolver = _resolvers[operationName];
    if (resolver == null) {
      throw Exception('No resolver registered for $operationName');
    }
    return resolver;
  }
}
