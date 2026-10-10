enum DrawSpace { world, screen }

/// Unité des dimensions (rayon, épaisseur de trait) d'une commande.
enum DrawUnit {
  /// Pixels écran : taille constante à l'écran en couche screen,
  /// et équivalente au zoom de référence en couche world.
  px,

  /// Unités du monde (mètres) : dimension physique, grandit avec le zoom.
  world,
}
