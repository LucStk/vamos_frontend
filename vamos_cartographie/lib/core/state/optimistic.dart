class Optimistic<T> {
  final T previous;
  final T optimistic;

  const Optimistic({required this.previous, required this.optimistic});
}
