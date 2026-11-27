import 'package:material_ui/material_ui.dart';

/// Libellés et couleurs des catégories renvoyées par le serveur. Une clé
/// inconnue s'affiche telle quelle : un nouveau type côté serveur ne casse rien.

const _roadKindLabels = {
  'motorway': 'Autoroute',
  'trunk': 'Voie rapide',
  'primary': 'Route nationale',
  'secondary': 'Route départementale',
  'tertiary': 'Route secondaire',
  'local': 'Rue ou voie communale',
  'service': 'Voie de service',
  'track': 'Chemin',
  'mountain_bike': 'Tout terrain (VTT)',
  'cycleway': 'Piste cyclable',
  'path': 'Sentier ou voie piétonne',
  'steps': 'Escaliers',
  'ferry': 'Bac',
  'other': 'Autre',
};

const _surfaceLabels = {
  'paved_smooth': 'Revêtement lisse',
  'paved': 'Revêtu',
  'paved_rough': 'Revêtu irrégulier',
  'compacted': 'Terre compactée',
  'dirt': 'Terre',
  'gravel': 'Gravier',
  'path': 'Sentier',
  'impassable': 'Impraticable',
  'unknown': 'Inconnu',
};

const _cycleLabels = {
  'separated': 'Piste cyclable',
  'lane': 'Bande cyclable',
  'shared': 'Voie partagée',
  'none': 'Sans aménagement',
};

String roadKindLabel(String key) => _roadKindLabels[key] ?? key;
String surfaceLabel(String key) => _surfaceLabels[key] ?? key;
String cycleLabel(String key) => _cycleLabels[key] ?? key;

/// Couleur d'une catégorie : stable d'un affichage à l'autre.
Color shareColor(BuildContext context, String key) {
  final scheme = Theme.of(context).colorScheme;
  return switch (key) {
    // Aménagements favorables
    'cycleway' || 'separated' => Colors.green.shade600,
    'lane' => Colors.lightGreen.shade600,
    'shared' => Colors.amber.shade700,
    // Routes
    'motorway' || 'trunk' => Colors.red.shade600,
    'primary' => Colors.deepOrange.shade400,
    'secondary' => Colors.orange.shade500,
    'tertiary' => Colors.amber.shade600,
    'local' || 'service' => scheme.primary,
    // Chemins
    'track' || 'dirt' || 'gravel' || 'compacted' => Colors.brown.shade400,
    'mountain_bike' || 'path' || 'steps' => Colors.teal.shade600,
    // Revêtements
    'paved_smooth' || 'paved' => scheme.secondary,
    'paved_rough' => Colors.blueGrey.shade400,
    _ => scheme.outline,
  };
}
