import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_stats.dart';

/// Les morceaux d'un jour (un par span de mobilité traversé) : en toucher un
/// ouvre sa fiche.
class DayRunsList extends ConsumerWidget {
  const DayRunsList({super.key, required this.tripId, required this.endsAt});

  final TripId tripId;
  final WaypointId? endsAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runs = ref.watch(dayRunsProvider(tripId, endsAt))?.runs ?? const [];
    if (runs.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 24),
        Text('Morceaux', style: Theme.of(context).textTheme.titleSmall),
        for (final run in runs)
          _RunTile(
            runKey: (tripId: tripId, endsAt: endsAt, spanId: run.mobilityId),
          ),
      ],
    );
  }
}

class _RunTile extends ConsumerWidget {
  const _RunTile({required this.runKey});

  final RunKey runKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = watchRunStats(ref, runKey);
    if (stats == null) return const SizedBox.shrink();
    final style = stats.mobility.display;
    final title = ref.watch(runNoteProvider(runKey))?.title.trim() ?? '';

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(style.icon, color: style.color),
      title: Text(title.isEmpty ? style.label : title),
      subtitle: Text(
        title.isEmpty
            ? formatDistance(stats.distanceM)
            : '${style.label} · ${formatDistance(stats.distanceM)}',
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => ref.applyTransition(
        Transition.set<MapObject>(
          selectionSlot,
          MapDayRun(
            tripId: runKey.tripId,
            endsAt: runKey.endsAt,
            spanId: runKey.spanId,
          ),
        ),
      ),
    );
  }
}
