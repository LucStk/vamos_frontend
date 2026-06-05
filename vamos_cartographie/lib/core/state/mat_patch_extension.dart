import "patch.dart";

extension MapPatch<K, V> on Map<K, V> {
  Map<K, V> applyPatch(K key, Patch<V> patch) {
    final current = this[key];
    if (current == null) return this;

    final updated = Map<K, V>.from(this);
    updated[key] = patch.apply(current);

    return updated;
  }
}
