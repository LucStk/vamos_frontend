class EntityState<T> {
  final T value;
  final int revision;
  final DateTime updatedAt;

  // Constructeur corrigé
  EntityState({
    required this.value,
    this.revision = 0, // On lui donne une valeur par défaut (ex: 0)
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now(); // Initialisation propre

  // Méthode copyWith corrigée
  EntityState<T> copyWith({T? value, int? revision, DateTime? updatedAt}) {
    return EntityState<T>(
      value: value ?? this.value,
      // Si aucun revision précise n'est fourni, on l'incrémente juste juste de 1
      revision: revision ?? (this.revision + 1),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
