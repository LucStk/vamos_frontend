import "package:flutter/material.dart";
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "_waypoint_header.dart";
import "../shared/types_selector/waypoint_type_selector.dart";
import '../shared/text_area_counter.dart';

class WaypointEditor extends StatelessWidget {
  final ValueNotifier<Waypoint> draft;

  const WaypointEditor({super.key, required this.draft});

  void _patch(Waypoint newWaypoint) {
    draft.value = newWaypoint;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Waypoint>(
      valueListenable: draft,

      builder: (context, waypoint, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    // ── Titre ───────────────────────────────
                    TextFormField(
                      initialValue: waypoint.title ?? '',

                      decoration: const InputDecoration(
                        labelText: 'Titre du waypoint',
                        border: OutlineInputBorder(),
                      ),

                      onChanged: (newTitle) {
                        _patch(waypoint.copyWith(title: newTitle));
                      },
                    ),

                    const Divider(),

                    // ── Description ────────────────────────
                    TextAreaWithCounter(
                      initialValue: waypoint.description ?? '',
                      readOnly: false,

                      onChanged: (newDescription) {
                        _patch(waypoint.copyWith(description: newDescription));
                      },
                    ),

                    const SizedBox(height: 4),

                    // ── Images ─────────────────────────────
                    ImageCarouselPicker(
                      remoteImages: waypoint.images ?? [],
                      readOnly: false,

                      onChanged: (newImages) {
                        _patch(waypoint.copyWith(images: newImages));
                      },
                    ),

                    const SizedBox(height: 16),

                    // ── Header ─────────────────────────────
                    WaypointHeader(type: waypoint.type),

                    const SizedBox(height: 12),

                    // ── Type ───────────────────────────────
                    WaypointTypeSelector(
                      selectedType: waypoint.type,

                      onTypeChanged: (newType) {
                        _patch(waypoint.copyWith(type: newType));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
