class OptimisticSpec<T> {
  final void Function() apply;
  final void Function() rollback;
  final void Function(T result)? reconcile;

  OptimisticSpec({required this.apply, required this.rollback, this.reconcile});
}
