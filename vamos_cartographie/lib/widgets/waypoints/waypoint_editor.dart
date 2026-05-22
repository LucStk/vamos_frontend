import "package:flutter/material.dart";

import 'package:vamos_cartographie/domain/domain.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import 'package:vamos_cartographie/widgets/waypoints/waypoint_type_selector.dart';
import "waypoint_header.dart";

import '../text_area_counter.dart';

class WaypointEditor extends StatelessWidget {
  final int waypointIndex;
  final GWaypointEnum selectedType;
  final String pendingDescription;
  final List<TripImage> pendingImages;

  final ValueChanged<GWaypointEnum> onTypeChanged;
  final ValueChanged<String> onDescriptionChanged;
  final ValueChanged<List<TripImage>> onImagesChanged;
  final VoidCallback onDelete;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const WaypointEditor({
    super.key,
    required this.waypointIndex,
    required this.selectedType,
    required this.pendingDescription,
    required this.pendingImages,
    required this.onTypeChanged,
    required this.onDescriptionChanged,
    required this.onImagesChanged,
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
                WaypointHeader(type: selectedType),
                const SizedBox(height: 12),

                // ── Sélecteur de type ──
                WaypointTypeSelector(
                  selectedType: selectedType,
                  onTypeChanged: onTypeChanged,
                ),

                const Divider(),

                // ── Photos ──
                const SizedBox(height: 4),
                ImageCarouselPicker(
                  remoteImages: pendingImages,
                  readOnly: false,
                  onChanged: onImagesChanged,
                ),

                // ── Description ──
                const Divider(),
                TextAreaWithCounter(
                  initialValue: pendingDescription,
                  readOnly: false,
                  onChanged: onDescriptionChanged,
                ),

                // ── Suppression ──
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Supprimer ce waypoint'),
                  onTap: onDelete,
                ),
                const SizedBox(height: 8),
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
