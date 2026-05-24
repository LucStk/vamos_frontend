import "package:flutter/material.dart";

import 'package:vamos_cartographie/domain/domain.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "_waypoint_header.dart";
import "_waypoint_type_selector.dart";
import '../text_area_counter.dart';

class WaypointEditor extends StatelessWidget {
  final Waypoint waypoint;
  final VoidCallback onDelete;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final ValueChanged<GWaypointEnum> onTypeChanged;

  const WaypointEditor({
    super.key,
    required this.waypoint,
    required this.onTypeChanged,
    required this.onDelete,
    required this.onConfirm,
    required this.onCancel,
  });

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
                const SizedBox(height: 12),

                // ── Sélecteur de type ──
                WaypointTypeSelector(
                  selectedType: waypoint.type,
                  onTypeChanged: onTypeChanged,
                ),

                const Divider(),

                // ── Photos ──
                const SizedBox(height: 4),
                ImageCarouselPicker(
                  remoteImages: waypoint.images!,
                  readOnly: false,
                  onChanged: (_) => {},
                ),

                // ── Description ──
                const Divider(),
                TextAreaWithCounter(
                  initialValue: waypoint.description!,
                  readOnly: false,
                  onChanged: (_) => {},
                ),
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
              TextButton(onPressed: onCancel, child: const Text('Annuler')),
              const Spacer(),
              FilledButton(
                onPressed: onConfirm,
                child: const Text('Confirmer'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
