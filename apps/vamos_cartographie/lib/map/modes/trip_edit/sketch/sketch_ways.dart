import 'package:domain_core/domain_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/proposal_ways_provider.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/route_insights_labels.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';

/// Légende du type de route que le tracé colore, pour juger du danger d'un
/// itinéraire à vélo : une pastille par catégorie, avec la distance.
///
/// Rien hors vélo : le serveur n'analyse la nature des voies que pour lui. À
/// vélo, une absence se dit, pour qu'on ne la confonde pas avec un oubli.
class SketchWays extends ConsumerWidget {
  const SketchWays({
    super.key,
    required this.tripId,
    required this.proposalId,
    required this.mobility,
  });

  final TripId tripId;
  final Id proposalId;
  final MobilityType mobility;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (mobility != MobilityType.bike) return const SizedBox.shrink();

    final ways = ref.watch(
      proposalWaysProvider((tripId: tripId, proposalId: proposalId)),
    );
    final theme = Theme.of(context);

    if (ways.isLoading) return const SizedBox.shrink();
    final failure = ways.error;
    if (failure != null) {
      return _note(
        theme,
        failure is Failure
            ? 'Type de route indisponible : ${failure.message}'
            : 'Type de route indisponible.',
      );
    }
    final spans = ways.value;
    if (spans == null || spans.isEmpty) {
      return _note(theme, 'Type de route indisponible pour ce tracé.');
    }

    final lengths = <String, double>{};
    for (final s in spans) {
      lengths.update(
        wayRiskKey(s),
        (m) => m + s.lengthM,
        ifAbsent: () => s.lengthM,
      );
    }
    final ordered = lengths.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Wrap(
        spacing: 12,
        runSpacing: 4,
        children: [
          for (final e in ordered)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: wayRiskColor(e.key),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${_label(e.key)} · ${_km(e.value)}',
                  style: theme.textTheme.labelMedium,
                ),
              ],
            ),
        ],
      ),
    );
  }

  static Widget _note(ThemeData theme, String text) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Text(
      text,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    ),
  );

  static String _label(String key) => switch (key) {
    'separated' => cycleLabel('separated'),
    'unknown' => 'Nature inconnue',
    _ => roadKindLabel(key),
  };

  static String _km(double meters) => meters < 1000
      ? '${meters.round()} m'
      : '${(meters / 1000).toStringAsFixed(1)} km';
}
