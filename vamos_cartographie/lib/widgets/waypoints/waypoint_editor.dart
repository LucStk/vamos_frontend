import "package:flutter/material.dart";

import 'package:vamos_cartographie/domain/domain.dart';
import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "waypoint_header.dart";

import '../text_area_counter.dart';

class WaypointEditor extends StatelessWidget {
  final int waypointIndex;
  final GWaypointTypeEnum selectedType;
  final String pendingDescription;
  final List<TripImage> pendingImages;

  final ValueChanged<GWaypointTypeEnum> onTypeChanged;
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
                WaypointHeader(type: selectedType, index: waypointIndex),
                const SizedBox(height: 12),

                // ── Sélecteur de type ──
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: GWaypointTypeEnum.values.map((type) {
                      final selected = selectedType == type;
                      return GestureDetector(
                        onTap: () => onTypeChanged(type),
                        child: Container(
                          width: 72,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: selected
                                ? type.color.withOpacity(0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selected
                                  ? type.color
                                  : Colors.grey.shade300,
                              width: selected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(type.icon, color: type.color, size: 24),
                              const SizedBox(height: 4),
                              Text(
                                type.label,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: selected ? type.color : Colors.black87,
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
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
