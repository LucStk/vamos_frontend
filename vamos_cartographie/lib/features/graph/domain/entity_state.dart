class EntityState<T> {
  final T value;
  final int revision;
  final DateTime updatedAt;

  const EntityState({
    required this.value,
    required this.revision,
    required this.updatedAt,
  });

  EntityState<T> copyWith({T? value, int? revision, DateTime? updatedAt}) {
    return EntityState<T>(
      value: value ?? this.value,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
