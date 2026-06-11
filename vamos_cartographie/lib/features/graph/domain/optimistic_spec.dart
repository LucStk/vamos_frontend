class OptimisticSpec<T> {
  final void Function() apply;
  final void Function() rollback;

  /// version locale au moment de l'envoi
  final int revision;

  /// vérifie si on peut appliquer la réponse
  final bool Function()? isStillValid;

  final void Function(T result)? reconcile;

  OptimisticSpec({
    required this.apply,
    required this.rollback,
    required this.revision,
    this.isStillValid,
    this.reconcile,
  });
}
