abstract class SelectionResolver {
  Map<String, dynamic> resolveRoot(Map<String, dynamic> variables);

  dynamic resolveField(String fieldName);
}
