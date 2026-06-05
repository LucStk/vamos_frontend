class Patch<T> {
  final T Function(T current) apply;

  Patch(this.apply);
}
