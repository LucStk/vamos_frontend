import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/header/floating_trip_card.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/header/trip_info_bar.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_compact_content.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/sheet/trip_viewer_content.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_card_bottom_sheet.dart';

@Dependencies([])
class TripBottomSheet extends ConsumerWidget {
  final TripId tripId;
  const TripBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      throw NotFoundFailure(resourceId: tripId.value, resourceType: 'trip');
    }

    return FloatingCardBottomSheet(
      cardBuilder: (_, progress) =>
          FloatingTripCard(trip: trip, progress: progress),
      header: TripInfoBar(trip: trip),
      compactContent: TripCompactContent(trip: trip),
      expandedContent: TripViewerContent(trip: trip),
    );
  }
}
