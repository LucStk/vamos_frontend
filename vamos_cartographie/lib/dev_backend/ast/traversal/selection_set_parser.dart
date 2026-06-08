class SelectionNode {
  final String name;
  final List<SelectionNode> children;

  SelectionNode(this.name, [this.children = const []]);
}

/// Parser ultra simplifié (version MVP)
class SelectionSetParser {
  SelectionNode parse(Map<String, dynamic> selectionSet) {
    final fields = <SelectionNode>[];

    selectionSet.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        fields.add(SelectionNode(key, parse(value).children));
      } else {
        fields.add(SelectionNode(key));
      }
    });

    return SelectionNode('root', fields);
  }
}
