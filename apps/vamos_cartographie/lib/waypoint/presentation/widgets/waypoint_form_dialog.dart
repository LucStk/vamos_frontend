import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';
import 'package:vamos_cartographie/waypoint/presentation/presentation.dart';

class WaypointFormDialog extends ConsumerStatefulWidget {
  final WaypointFields initialWaypoint;
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
  late WaypointPatchModel currentWaypoint;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    currentWaypoint = WaypointPatchModel.fromFields(widget.initialWaypoint);
  }

  void _patch(WaypointPatchModel newWaypoint) {
    setState(() {
      currentWaypoint = newWaypoint;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          ImageCarouselPicker(id: widget.initialWaypoint.id),

          const SizedBox(height: 16),

          // ── Header ─────────────────────────────
          WaypointHeader(type: currentWaypoint.poiCategoryUi),

          const SizedBox(height: 12),

          // ── Type ───────────────────────────────
          TypeSelector(
            values: PoiCategoryStyle.values,
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
            setState(() => _isSaving = true);
            // 1. On capture le navigator AU DÉBUT, quand le contexte est 100% valide
            final navigator = Navigator.of(context);

            setState(
              () => _isSaving = true,
            ); // Pense à l'activer ici d'ailleurs !

            final waypointResult = await ref
                .read(waypointStoreProvider(widget.tripId).notifier)
                .updateWaypoint(currentWaypoint);

            // final mediaResult = await ref
            //     .read(waypointStoreProvider(widget.tripId).notifier)
            //     .attachFileToWaypoint(
            //       currentWaypoint.id,
            //       MediaOwnerType.waypoint,
            //     );

            // 2. On vérifie si le widget State est toujours là
            if (!mounted) return;

            if (waypointResult.isRight()) {
              //&& mediaResult.isEmpty) {
              // 3. On utilise la référence capturée, le linter adore ça !
              navigator.pop();
            }

            setState(() => _isSaving = false);
          },
        ),
      ],
    );
  }
}
