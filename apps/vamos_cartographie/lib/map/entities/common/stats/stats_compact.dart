import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_expand_button.dart';

/// Page compacte générique : un titre et les 3 premières stats en tuiles.
class StatsCompact extends StatelessWidget {
  const StatsCompact({super.key, required this.title, required this.stats});

  final String title;
  final List<StatItem> stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shown = stats.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: theme.textTheme.titleSmall)),
            const SheetExpandButton(),
          ],
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Row(
            children: [
              for (var i = 0; i < shown.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(child: _StatTile(stat: shown[i])),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat});

  final StatItem stat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(stat.icon, size: 18, color: scheme.primary),
          const SizedBox(height: 4),
          Text(
            stat.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall,
          ),
          Text(
            stat.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
