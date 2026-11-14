import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/trip/pages/trip_stats/trip_stats.dart';

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
