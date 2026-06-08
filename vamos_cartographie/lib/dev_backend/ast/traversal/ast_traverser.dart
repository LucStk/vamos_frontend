import '../executor/selection_resolver.dart';
import 'selection_set_parser.dart';

class AstTraverser {
  final SelectionSetParser parser;

  AstTraverser(this.parser);

  Map<String, dynamic> traverse(
    Map<String, dynamic> selectionSet,
    SelectionResolver resolver,
  ) {
    final node = parser.parse(selectionSet);

    return _visit(node, resolver);
  }

  Map<String, dynamic> _visit(SelectionNode node, SelectionResolver resolver) {
    final result = <String, dynamic>{};

    for (final child in node.children) {
      final value = resolver.resolveField(child.name);

      if (value is Map<String, dynamic>) {
        result[child.name] = _visit(child, resolver);
      } else {
        result[child.name] = value;
      }
    }

    return result;
  }
}
