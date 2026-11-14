import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
// TODO: adapter le chemin vers ton widget LightBox.
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/header/trip_header.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/photo_strip.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Page 1 : titre + galerie
// ─────────────────────────────────────────────────────────────────────────────

class TripOverviewCompact extends ConsumerWidget {
  const TripOverviewCompact({
    super.key,
    required this.trip,
    this.editable = false,
  });

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileIds = ref
        .watch(storedFileStoreProvider.select((s) => s.getFromOwner(trip.id)))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TripHeader(
                title: trip.title,
                canEdit: editable,
                onRename: (newTitle) async {
                  ref
                      .read(tripStoreProvider.notifier)
                      .updateTrip(trip.copyWith(title: newTitle));
                  return null;
                },
              ),
            ),
            const SheetExpandButton(),
          ],
        ),
        const Spacer(),
        TripPhotoStrip(fileIds: fileIds, editable: editable),
      ],
    );
  }
}
