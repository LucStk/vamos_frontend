class Tx<T> {
  final int id;
  final T before;
  T after;
  bool committed;

  Tx({
    required this.id,
    required this.before,
    required this.after,
    this.committed = false,
  });
}
