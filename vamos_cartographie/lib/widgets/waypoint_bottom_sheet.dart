import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'image_carousel_picker.dart';
import '../models.dart';
import 'text_area_counter.dart';

class WaypointBottomSheet extends StatefulWidget {
  final int waypointIndex;
  final Trip trip;
  final void Function(GWaypointTypeEnum) onTypeChanged;
  final void Function() onDelete;
  final bool readOnly;

  const WaypointBottomSheet({
    super.key,
    required this.waypointIndex,
    required this.trip,
    required this.onTypeChanged,
    required this.onDelete,
    this.readOnly = false,
  });

  @override
  State<WaypointBottomSheet> createState() => _WaypointBottomSheetState();
}

class _WaypointBottomSheetState extends State<WaypointBottomSheet> {
  final ScrollController _scrollController = ScrollController();
  late GWaypointTypeEnum _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.trip.waypoints[widget.waypointIndex].type;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wp = widget.trip.waypoints[widget.waypointIndex];
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.92,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Poignée
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),

              // En-tête avec icône du type
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: _selectedType.color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _selectedType.icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedType.label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _selectedType.color,
                          ),
                        ),
                        Text(
                          'Étape ${widget.waypointIndex + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Sélecteur de type (éditeur uniquement) ──
                      if (!widget.readOnly) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: GWaypointTypeEnum.values.map((type) {
                              final selected = _selectedType == type;
                              return GestureDetector(
                                onTap: () {
                                  setState(() => _selectedType = type);
                                  widget.onTypeChanged(type);
                                },
                                child: Container(
                                  width: 72,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
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
                                      Icon(
                                        type.icon,
                                        color: type.color,
                                        size: 24,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        type.label,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: selected
                                              ? type.color
                                              : Colors.black87,
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
                      ],

                      // ── Photos ──
                      const SizedBox(height: 4),
                      ImageCarouselPicker(
                        remoteImagesPaths: wp.images ?? [],
                        readOnly: widget.readOnly,
                        onChanged: (urls) {
                          setState(() {
                            wp.images
                              ?..clear()
                              ..addAll(urls);
                          });
                        },
                      ),

                      // ── Description ──
                      if ((wp.description != null &&
                              wp.description!.isNotEmpty) ||
                          !widget.readOnly) ...[
                        const Divider(),
                        TextAreaWithCounter(
                          initialValue: wp.description ?? '',
                          readOnly: widget.readOnly,
                          onChanged: (value) {
                            wp.description = value;
                          },
                        ),
                      ],

                      // ── Suppression (éditeur uniquement) ──
                      if (!widget.readOnly) ...[
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.delete, color: Colors.red),
                          title: const Text('Supprimer ce waypoint'),
                          onTap: () {
                            widget.onDelete();
                            Navigator.pop(context);
                          },
                        ),
                      ],

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
