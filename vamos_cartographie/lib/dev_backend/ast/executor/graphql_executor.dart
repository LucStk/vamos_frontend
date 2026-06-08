import '../registry/resolver_registry.dart';
import '../traversal/ast_traverser.dart';
import '../traversal/selection_set_parser.dart';

class GraphQLExecutor {
  final ResolverRegistry registry;
  final AstTraverser traverser;

  GraphQLExecutor({required this.registry, required this.traverser});

  Map<String, dynamic> execute({
    required String operationName,
    required Map<String, dynamic> variables,
    required Map<String, dynamic> selectionSet,
  }) {
    final resolver = registry.resolve(operationName);

    final root = resolver.resolveRoot(variables);

    return traverser.traverse(selectionSet, resolver);
  }
}
