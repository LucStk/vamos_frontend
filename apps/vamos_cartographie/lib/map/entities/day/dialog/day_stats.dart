import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';

/// La distance d'un jour, et ce qu'on y fait avec chaque mobilité.
typedef DayStats = ({
  double distanceM,
  List<({MobilityType mobility, double distanceM})> byMobility,
});

/// Calcule les chiffres du jour [endsAt] depuis ses morceaux, la plus
/// présente des mobilités d'abord. Vide si le jour n'a pas de géométrie.
DayStats watchDayStats(WidgetRef ref, TripId tripId, WaypointId? endsAt) {
  final runs = ref.watch(dayRunsProvider(tripId, endsAt))?.runs ?? const [];
  final perMobility = <MobilityType, double>{};
  var total = 0.0;
  for (final run in runs) {
    final stats = watchRunStats(ref, (
      tripId: tripId,
      endsAt: endsAt,
      spanId: run.mobilityId,
    ));
    if (stats == null) continue;
    total += stats.distanceM;
    perMobility.update(
      stats.mobility,
      (d) => d + stats.distanceM,
      ifAbsent: () => stats.distanceM,
    );
  }
  final byMobility = [
    for (final e in perMobility.entries) (mobility: e.key, distanceM: e.value),
  ]..sort((a, b) => b.distanceM.compareTo(a.distanceM));
  return (distanceM: total, byMobility: byMobility);
}

/// Onglet « Statistiques » d'un jour : sa distance et la répartition des
/// mobilités (au prorata de la distance parcourue ce jour-là).
class DayStatsView extends ConsumerWidget {
  const DayStatsView({super.key, required this.tripId, required this.endsAt});

  final TripId tripId;
  final WaypointId? endsAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final stats = watchDayStats(ref, tripId, endsAt);

    if (stats.distanceM <= 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'Aucun trajet ce jour-là.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: scheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(Icons.straighten, color: scheme.primary),
              const SizedBox(height: 6),
              Text(
                formatDistance(stats.distanceM),
                style: theme.textTheme.titleLarge,
              ),
              Text(
                'Distance du jour',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Mobilités',
          style: theme.textTheme.labelLarge?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 10,
            child: Row(
              children: [
                for (final m in stats.byMobility)
                  Expanded(
                    // Les parts sont des distances : un flex entier suffit.
                    flex: (m.distanceM / stats.distanceM * 1000).round().clamp(
                      1,
                      1000,
                    ),
                    child: ColoredBox(color: m.mobility.display.color),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        for (final m in stats.byMobility)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(
                  m.mobility.display.icon,
                  color: m.mobility.display.color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    m.mobility.display.label,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Text(
                  '${(m.distanceM / stats.distanceM * 100).round()} % · '
                  '${formatDistance(m.distanceM)}',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
