import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:vamos_cartographie/features/shared/domain/entities/poi_ui.dart";
import '/features/carousel/widgets/widgets.dart';
import '/features/shared/shared.dart';
import "/features/waypoint/domain/waypoint_ui.dart";
import "waypoint_header.dart";

class WaypointEditor extends ConsumerStatefulWidget {
  final WaypointDraft initialWaypoint;
  const WaypointEditor({super.key, required this.initialWaypoint});

  @override
  State<WaypointEditor> createState() => WaypointEditorState(); // Public (sans _)
}

class WaypointEditorState extends State<WaypointEditor> {
  late WaypointDraft currentWaypoint; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentWaypoint = widget.initialWaypoint;
  }

  void _patch(WaypointDraft newWaypoint) {
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
          onChanged: (val) => _patch(currentWaypoint.copyWith(title: val)),
        ),
        const Divider(),
        TextAreaWithCounter(
          initialValue: currentWaypoint.description,
          readOnly: false,
          onChanged: (val) =>
              _patch(currentWaypoint.copyWith(description: val)),
        ),

        const SizedBox(height: 4),

        // ── Images ─────────────────────────────
        ImageCarouselPicker(
          remoteImages: currentWaypoint.images,
          onChanged: (newImages) {
            _patch(currentWaypoint.copyWith(images: newImages));
          },
        ),

        const SizedBox(height: 16),

        // ── Header ─────────────────────────────
        WaypointHeader(type: currentWaypoint.categoryUi),

        const SizedBox(height: 12),

        // ── Type ───────────────────────────────
        TypeSelector(
          values: PoiCategoryUi.values,
          selectedType: currentWaypoint.categoryUi,

          onTypeChanged: (newType) {
            _patch(currentWaypoint.copyWith(poiCategory: newType.category));
          },
        ),
      ],
    );
  }
}
