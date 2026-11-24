import 'package:flutter/material.dart';

/// Valeurs de base du design de Vamos.
///
/// Pour changer l'identité visuelle de toute l'application, c'est ici
/// (et seulement ici) qu'il faut intervenir.
abstract final class AppTokens {
  /// Couleur de marque. Toute la palette Material 3 (primary, secondary,
  /// surface, error…) en est dérivée, en clair comme en sombre.
  /// Valeur actuelle de l'app : `Colors.green`.
  static const Color seed = Color(0xFF4CAF50);

  /// Couleurs secondaire et tertiaire, facultatives. Laissées à `null`, elles
  /// sont dérivées de [seed] (le secondaire est alors une version désaturée
  /// de la couleur de marque).
  ///
  /// Renseignées, chacune génère sa propre palette : les variantes
  /// `onSecondary`, `secondaryContainer`… et le mode sombre gardent un
  /// contraste correct sans rien calculer à la main.
  /// Ex. : `static const Color? secondarySeed = Color(0xFFFF8F00);`
  static const Color? secondarySeed = null;
  static const Color? tertiarySeed = null;

  /// Famille de police par défaut de tous les textes.
  ///
  /// Doit correspondre au `family:` déclaré dans `pubspec.yaml`
  /// (section `flutter: fonts:`). Si la police n'y est pas déclarée,
  /// Flutter retombe silencieusement sur la police du système.
  static const String fontFamily = 'Poppins';

  // Rayons de bordure. Ils reprennent ceux déjà utilisés dans l'app
  // (dialogues 16, feuille de formulaire 20, champs et boutons 12).
  static const double radiusS = 8;
  static const double radiusM = 12;
  static const double radiusL = 16;
  static const double radiusSheet = 20;
}
