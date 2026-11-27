import 'package:material_ui/material_ui.dart';

/// Rôles typographiques propres à Vamos, en plus de ceux de Material.
///
/// Usage : `Theme.of(context).textTheme.heading`.
extension AppTextRoles on TextTheme {
  /// Titre d'une fiche : en-tête de dialogue, titre de voyage ou d'étape.
  TextStyle? get heading => titleMedium?.copyWith(fontWeight: FontWeight.bold);

  /// Texte saisi par l'utilisateur (descriptions, notes) : interligne aéré.
  TextStyle? get prose => bodyMedium?.copyWith(height: 1.5);
}
