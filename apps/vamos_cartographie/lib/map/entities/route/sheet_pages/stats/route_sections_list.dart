import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stats_list.dart';

/// Page dépliée des stats de route : stats globales puis détail par section.
class RouteSectionsList extends StatelessWidget {
  const RouteSectionsList({
    super.key,
    required this.stats,
    required this.spans,
  });

  final List<StatItem> stats;
  final List<MobilitySpanFields> spans;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = [...spans]
      ..sort((a, b) => a.startIndex.compareTo(b.startIndex));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StatsList(stats: stats),
        const Divider(height: 24),
        Text('Sections', style: theme.textTheme.titleSmall),
        for (var i = 0; i < sorted.length; i++)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(radius: 12, child: Text('${i + 1}')),
            title: Text(sorted[i].mobilityType.name),
            trailing: Text(formatDistance(sorted[i].lengthM)),
          ),
      ],
    );
  }
}
