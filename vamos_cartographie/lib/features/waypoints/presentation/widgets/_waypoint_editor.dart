import "package:flutter/material.dart";
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';
import 'package:vamos_cartographie/shared/widgets/carousel/carousel.dart';
import 'package:vamos_cartographie/shared/widgets/shared/text_area_counter.dart';
import "_waypoint_header.dart";
import "types_selector/waypoint_type_selector.dart";

class WaypointEditor extends StatefulWidget {
  final Waypoint initialWaypoint;
  const WaypointEditor({super.key, required this.initialWaypoint});

  @override
  State<WaypointEditor> createState() => WaypointEditorState(); // Public (sans _)
}

class WaypointEditorState extends State<WaypointEditor> {
  late Waypoint currentWaypoint; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentWaypoint = widget.initialWaypoint;
  }

  void _patch(Waypoint newWaypoint) {
    setState(() {
      currentWaypoint = newWaypoint;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Juste la colonne de champs, pas de ScrollView ici, le Shell s'en occupe
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          initialValue: currentWaypoint.title ?? '',
          decoration: const InputDecoration(labelText: 'Titre du waypoint'),
          onChanged: (val) => _patch(currentWaypoint.copyWith(title: val)),
        ),
        const Divider(),
        TextAreaWithCounter(
          initialValue: currentWaypoint.description ?? '',
          readOnly: false,
          onChanged: (val) =>
              _patch(currentWaypoint.copyWith(description: val)),
        ),

        const SizedBox(height: 4),

        // ── Images ─────────────────────────────
        ImageCarouselPicker(
          remoteImages: currentWaypoint.images ?? [],
          readOnly: false,

          onChanged: (newImages) {
            _patch(currentWaypoint.copyWith(images: newImages));
          },
        ),

        const SizedBox(height: 16),

        // ── Header ─────────────────────────────
        WaypointHeader(type: currentWaypoint.type),

        const SizedBox(height: 12),

        // ── Type ───────────────────────────────
        WaypointTypeSelector(
          selectedType: currentWaypoint.type,

          onTypeChanged: (newType) {
            _patch(currentWaypoint.copyWith(type: newType));
          },
        ),
      ],
    );
  }
}
