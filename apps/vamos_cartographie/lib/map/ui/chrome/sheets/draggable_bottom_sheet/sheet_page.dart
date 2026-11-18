import 'package:flutter/material.dart';

/// Une "page" de la sheet : un contenu compact (au repos) associé à son
/// contenu déplié, plus l'icône qui la représente dans la barre du bas.
class SheetPage {
  const SheetPage({
    required this.label,
    required this.icon,
    this.selectedIcon,
    required this.compact,
    required this.expanded,
  });

  /// Pas affiché dans la barre (icônes seules) : sert au tooltip et à
  /// l'accessibilité.
  final String label;
  final IconData icon;

  /// Variante "pleine" de l'icône pour l'onglet actif (facultatif).
  final IconData? selectedIcon;

  /// Affiché au repos, dans le PageView horizontal.
  final Widget compact;

  /// Affiché quand la sheet est dépliée, pour la page courante.
  final Widget expanded;
}
