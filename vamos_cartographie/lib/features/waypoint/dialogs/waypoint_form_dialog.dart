import 'package:domain_core/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_application/media_application.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/core/injection/trip_domain/commands/waypoint_handler.dart';
import 'package:vamos_cartographie/features/carousel/carousel.dart';

import "package:vamos_cartographie/features/shared/shared.dart";
import 'package:vamos_cartographie/features/waypoint/waypoint.dart';
import 'package:vamos_cartographie/features/waypoint/widgets/waypoint_header.dart';

class WaypointFormDialog extends ConsumerStatefulWidget {
  final Waypoint initialWaypoint;
  final TripId tripId;

  const WaypointFormDialog({
    super.key,
    required this.tripId,
    required this.initialWaypoint,
  });

  @override
  ConsumerState<WaypointFormDialog> createState() => _FormWaypointDialogState();
}

class _FormWaypointDialogState extends ConsumerState<WaypointFormDialog> {
  late Waypoint currentWaypoint;
  bool _isSaving = false;

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
    final waypointHandler = ref.watch(waypointHandlerProvider(widget.tripId));
    return DialogShell(
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 680),

      content: Column(
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
            id: widget.initialWaypoint.id,
            ownerType: MediaOwnerType.waypoint,
          ),

          const SizedBox(height: 16),

          // ── Header ─────────────────────────────
          WaypointHeader(type: currentWaypoint.poiCategoryUi),

          const SizedBox(height: 12),

          // ── Type ───────────────────────────────
          TypeSelector(
            values: PoiCategoryUi.values,
            selectedType: currentWaypoint.poiCategoryUi,

            onTypeChanged: (newType) {
              _patch(currentWaypoint.copyWith(poiCategory: newType.category));
            },
          ),
        ],
      ),

      buttonsBuilder: (ctx) => [
        CancelButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        const Spacer(),

        ConfirmButton(
          isLoading: _isSaving,
          onPressed: () async {
            setState(() {
              _isSaving = true;
            });
            final res = await waypointHandler.updateWaypoint(currentWaypoint);
            res.fold(
              (Failure f) => setState(() {
                _isSaving = false;
              }),
              (_) => Navigator.of(context).pop(),
            );
          },
        ),
      ],
    );
  }
}
