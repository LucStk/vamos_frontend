import 'package:flutter/material.dart';

/// Contenu compact d'une page : ce qui est visible au repos.
class SheetCompact {
  const SheetCompact({required this.child, this.height = defaultHeight});

  static const double defaultHeight = 120;

  final Widget child;

  /// Hauteur réservée au contenu (hors poignée et marges). Le contenu doit y
  /// tenir : le pager des pages compactes a besoin d'une hauteur bornée.
  final double height;
}

/// Une page de la sheet : un onglet de la barre, son contenu compact, et
/// éventuellement un contenu déplié.
///
/// Toucher l'onglet de la page active fait le cycle compact → déplié → fermé
/// (compact → fermé sans [expanded]).
class SheetPage {
  const SheetPage({
    required this.icon,
    required this.label,
    required this.compact,
    this.selectedIcon,
    this.expanded,
    this.onClose,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;

  /// Contenu au repos, avec sa hauteur.
  final SheetCompact compact;

  /// Contenu déplié. Null : la page ne se déplie pas, la sheet ne monte pas
  /// au-dessus de sa taille compacte.
  final Widget? expanded;

  /// Appelé quand la sheet est fermée (onglet ou glissement vers le bas)
  /// pendant que cette page est affichée. Ex. abandonner la tâche en cours.
  final VoidCallback? onClose;
}
