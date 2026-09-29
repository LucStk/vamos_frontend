import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart'; // Remplacé cupertino par material pour SizedBox et ListView standard
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';
import '/map/overlay_ui/overlay_ui.dart';
import "bottom_sheet.dart";

class TripBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const TripBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      throw NotFoundFailure(resourceId: tripId.value, resourceType: "trip");
    }

    return DraggableBottomSheetShell(
      tripId: tripId,
      compactContent: TripCompactContent(trip: trip),
      builder: ({isAtmin = true, required scrollController}) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isAtmin
              ? TripCompactContent(key: const ValueKey('compact'), trip: trip)
              : TripViewerContent(key: const ValueKey('expanded'), trip: trip),
        );
      },
    );
  }
}
