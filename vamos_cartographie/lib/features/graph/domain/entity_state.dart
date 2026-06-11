class EntityState<T> {
  final T value;
  final int revision;
  final DateTime updatedAt;

  EntityState({required this.value, this.revision = 0, DateTime? updatedAt})
    : updatedAt = updatedAt ?? DateTime.now();

  EntityState<T> copyWith({T? value, int? revision, DateTime? updatedAt}) {
    return EntityState<T>(
      value: value ?? this.value,
      revision: revision ?? this.revision,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
