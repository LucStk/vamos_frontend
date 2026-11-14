import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

/// Une statistique numérique du voyage, partagée entre l'aperçu compact
/// (3 tuiles) et le contenu déplié (liste complète).
class TripStat {
  const TripStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

/// Les 3 premières sont affichées dans la page compacte, dans cet ordre.
List<TripStat> tripStatsOf(Trip trip) {
  // TODO: brancher sur les vrais champs de Trip / sur tes stores.
  return const [
    TripStat(icon: Icons.straighten, label: 'Distance', value: '—'),
    TripStat(
      icon: Icons.directions_walk,
      label: 'Mobilité préférée',
      value: '—',
    ),
    TripStat(icon: Icons.visibility_outlined, label: 'Vues', value: '—'),
    // Idées : durée, dénivelé, nombre d'étapes, date de création…
  ];
}

/// Contenu déplié associé à la page "Stats".
class TripStatsViewerContent extends StatelessWidget {
  const TripStatsViewerContent({super.key, required this.trip});

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stats = tripStatsOf(trip);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final s in stats)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(s.icon, color: theme.colorScheme.onSurfaceVariant),
            title: Text(s.label),
            trailing: Text(s.value, style: theme.textTheme.titleMedium),
          ),
      ],
    );
  }
}
