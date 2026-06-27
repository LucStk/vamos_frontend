class FileKey {
  final String value;
  const FileKey(this.value);

  @override
  bool operator ==(Object other) => other is FileKey && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

class Url {
  final String value;
  const Url(this.value);

  @override
  bool operator ==(Object other) => other is Url && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
