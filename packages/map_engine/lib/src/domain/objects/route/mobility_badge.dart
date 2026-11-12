// objects/segment/badge/mobility_badge.dart

part of '../map_objects.dart';

// Pastille de modalité posée au milieu d'une section, cliquable.
///
/// Objet distinct de [MapSection] : sans ça, le hit-test ne permettrait pas
/// de savoir si le tap visait la ligne ou la pastille.
final class MobilityBadge extends MapObject {
  const MobilityBadge({required this.sectionId, required this.mobility});

  /// La section dont ce badge porte la modalité. C'est lui qui permet au
  /// menu de savoir quoi modifier.
  final MobilitySpanId sectionId;

  /// Évite un aller-retour au store pour présélectionner la valeur
  /// courante dans le picker.
  final MobilityType mobility;

  @override
  bool operator ==(Object other) =>
      other is MobilityBadge &&
      other.sectionId == sectionId &&
      other.mobility == mobility;

  @override
  int get hashCode => Object.hash(sectionId, mobility);
}
