import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';

/// Les morceaux d'un jour (un par span de mobilité traversé), en une ligne
/// horizontale : chaque morceau a la couleur de sa mobilité et une longueur
/// proportionnelle à la part du jour qu'il représente. Le symbole de la
/// mobilité est au-dessus, la distance en dessous. En toucher un ouvre sa
/// fiche.
class DayRunsList extends ConsumerWidget {
  const DayRunsList({super.key, required this.tripId, required this.endsAt});

  final TripId tripId;
  final WaypointId? endsAt;

  /// Largeur plancher d'un morceau : de quoi y lire son symbole et sa
  /// distance, même s'il ne pèse presque rien dans la journée.
  static const _minSegmentWidth = 56.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runs = ref.watch(dayRunsProvider(tripId, endsAt))?.runs ?? const [];

    final segments = <_Segment>[];
    for (final run in runs) {
      final key = (tripId: tripId, endsAt: endsAt, spanId: run.mobilityId);
      final stats = watchRunStats(ref, key);
      if (stats != null) segments.add(_Segment(key, stats));
    }
    if (segments.isEmpty) return const SizedBox.shrink();

    final total = segments.fold(0.0, (sum, s) => sum + s.stats.distanceM);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 24),
        Text('Morceaux', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            // Largeur proportionnelle, avec un plancher ; si la somme déborde
            // (beaucoup de petits morceaux), la ligne défile.
            final available = constraints.maxWidth;
            final widths = <double>[
              for (final s in segments)
                max(
                  _minSegmentWidth,
                  total > 0
                      ? available * s.stats.distanceM / total
                      : available / segments.length,
                ),
            ];
            final strip = Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (i, s) in segments.indexed)
                  SizedBox(
                    width: widths[i],
                    child: _SegmentView(segment: s),
                  ),
              ],
            );
            final overflow = widths.fold(0.0, (a, b) => a + b) > available;
            return overflow
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: strip,
                  )
                // Les largeurs somment exactement à [available] : pas de
                // défilement, la ligne remplit la place.
                : strip;
          },
        ),
      ],
    );
  }
}

class _Segment {
  const _Segment(this.key, this.stats);

  final RunKey key;
  final RunStats stats;
}

class _SegmentView extends ConsumerWidget {
  const _SegmentView({required this.segment});

  final _Segment segment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final key = segment.key;
    final style = segment.stats.mobility.display;
    final title = ref.watch(runNoteProvider(key))?.title.trim() ?? '';

    return Tooltip(
      message: title.isEmpty ? style.label : '$title · ${style.label}',
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => ref.applyTransition(
          Transition.set<MapObject>(
            selectionSlot,
            MapDayRun(
              tripId: key.tripId,
              endsAt: key.endsAt,
              spanId: key.spanId,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
          child: Column(
            children: [
              Icon(style.icon, color: style.color, size: 22),
              const SizedBox(height: 4),
              // La barre : sa couleur est celle de la mobilité.
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: style.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  formatDistance(segment.stats.distanceM),
                  style: theme.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
