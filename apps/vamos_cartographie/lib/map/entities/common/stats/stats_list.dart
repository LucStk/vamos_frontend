import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';

/// Page dépliée générique : toutes les stats, une par ligne.
class StatsList extends StatelessWidget {
  const StatsList({super.key, required this.stats});

  final List<StatItem> stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
