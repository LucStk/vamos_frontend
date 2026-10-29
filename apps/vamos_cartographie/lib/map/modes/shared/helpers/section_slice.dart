/// Extrait les points de `first` à `last` inclus, bornés à la liste.
/// Renvoie `null` si la section est dégénérée (rien à tracer).
List<T>? sliceBetween<T>(List<T> points, int first, int last) {
  if (points.isEmpty) return null;
  final from = first.clamp(0, points.length - 1);
  final to = last.clamp(0, points.length - 1);
  if (to <= from) return null;
  return points.sublist(from, to + 1);
}
