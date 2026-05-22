import "package:flutter/material.dart";

import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "waypoint_header.dart";

import '../text_area_counter.dart';

class WaypointViewer extends StatelessWidget {
  final Waypoint waypoint;
  final VoidCallback? onEdit;
  const WaypointViewer({super.key, required this.waypoint, this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Contenu scrollable ──
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WaypointHeader(type: waypoint.type),
                const SizedBox(height: 16),

                // Photos
                ImageCarouselPicker(
                  remoteImages: waypoint.images ?? [],
                  readOnly: true,
                  onChanged: (_) {},
                ),

                // Description
                if (waypoint.description != null &&
                    waypoint.description!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  TextAreaWithCounter(
                    initialValue: waypoint.description!,
                    readOnly: true,
                    onChanged: (_) {},
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),

        // ── Boutons ──
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Fermer'),
              ),
              const Spacer(),
              if (onEdit != null)
                OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('Modifier'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
