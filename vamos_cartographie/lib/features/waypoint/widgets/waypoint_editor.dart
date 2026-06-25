import "package:flutter/material.dart";
import "package:vamos_cartographie/features/waypoint/domain/poi_ui.dart";
import '/features/carousel/widgets/widgets.dart';
import '/features/shared/shared.dart';
import "/features/waypoint/domain/waypoint_ui.dart";
import "waypoint_header.dart";

class WaypointEditor extends StatefulWidget {
  final WaypointUi initialWaypoint;
  const WaypointEditor({super.key, required this.initialWaypoint});

  @override
  State<WaypointEditor> createState() => WaypointEditorState(); // Public (sans _)
}

class WaypointEditorState extends State<WaypointEditor> {
  late WaypointUi currentWaypoint; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentWaypoint = widget.initialWaypoint;
  }

  void _patch(WaypointUi newWaypoint) {
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
          initialValue: currentWaypoint.title,
          decoration: const InputDecoration(labelText: 'Titre'),
          onChanged: (val) =>
              _patch(currentWaypoint.copyWith(title: val) as WaypointUi),
        ),
        const Divider(),
        TextAreaWithCounter(
          initialValue: currentWaypoint.description,
          readOnly: false,
          onChanged: (val) =>
              _patch(currentWaypoint.copyWith(description: val) as WaypointUi),
        ),

        const SizedBox(height: 4),

        // ── Images ─────────────────────────────
        ImageCarouselPicker(id: widget.initialWaypoint.id),

        const SizedBox(height: 16),

        // ── Header ─────────────────────────────
        WaypointHeader(type: currentWaypoint.poiCategoryUi),

        const SizedBox(height: 12),

        // ── Type ───────────────────────────────
        TypeSelector(
          values: PoiCategoryUi.values,
          selectedType: currentWaypoint.poiCategoryUi,

          onTypeChanged: (newType) {
            _patch(
              currentWaypoint.copyWith(poiCategory: newType.category)
                  as WaypointUi,
            );
          },
        ),
      ],
    );
  }
}
