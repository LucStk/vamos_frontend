/// Traits visuels d'un objet. Ils se cumulent : un span peut être
/// sélectionné ET survolé.
///
/// L'ordre de déclaration est l'ordre de composition des looks : un trait
/// déclaré plus bas l'emporte sur ceux du dessus quand ils sont tous à 1.
/// [dimmed] (objet écarté, rendu transparent) est donc en premier : toucher
/// ou survoler un objet écarté le rend de nouveau opaque.
enum VisualTrait { dimmed, hovered, selected, dragging }

/// Poids courant de chaque trait, de 0 (absent) à 1 (pleinement présent).
/// Un trait absent de la map vaut 0. La map passée ne doit plus être mutée.
final class VisualWeights {
  const VisualWeights([this._values = const {}]);

  static const none = VisualWeights();

  final Map<VisualTrait, double> _values;

  double operator [](VisualTrait trait) => _values[trait] ?? 0.0;

  bool get isNone => _values.values.every((v) => v <= 0);

  /// Les mêmes poids, sans [trait] : pour dessiner un objet comme s'il ne
  /// l'avait pas (ex. une sélection rendue autrement qu'avec le look
  /// `selected`).
  VisualWeights without(VisualTrait trait) => VisualWeights({
    for (final e in _values.entries)
      if (e.key != trait) e.key: e.value,
  });
}
