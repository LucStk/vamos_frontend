// ── _OptionTile ───────────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import "../models/map_context_action.dart";

class OptionTile extends StatelessWidget {
  final MapContextAction option;
  final LatLng position;

  const OptionTile({super.key, required this.option, required this.position});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async => await option.onTap?.call(position),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Icon(option.icon, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                option.label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
