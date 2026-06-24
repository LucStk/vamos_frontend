class GraphId {
  final String value;
  const GraphId(this.value);

  @override
  bool operator ==(Object other) => other is GraphId && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
