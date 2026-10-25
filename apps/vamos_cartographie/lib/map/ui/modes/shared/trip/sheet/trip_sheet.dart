import 'package:domain_core/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/modes/shared/trip/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/modes/shared/trip/header/trip_info_bar.dart';
import 'package:vamos_cartographie/map/ui/modes/shared/trip/sheet/trip_compact_content.dart';
import 'package:vamos_cartographie/map/ui/modes/shared/trip/sheet/trip_viewer_content.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_card_bottom_sheet.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_header_card.dart';

@Dependencies([])
class TripSheet extends ConsumerWidget {
  const TripSheet({super.key, required this.canEdit, required this.tripId});

  final TripId tripId;
  final bool canEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      throw NotFoundFailure(resourceId: tripId.value, resourceType: 'trip');
    }
    Future<Failure?> onRename(String title) async {
      final c = await ref
          .read(tripStoreProvider.notifier)
          .updateTrip(trip.copyWith(title: title));
      return c.fold((Failure f) => f, (_) => null);
    }

    return FloatingCardBottomSheet(
      card: FloatingHeaderCard(
        child: TripHeader(
          title: trip.title,
          onRename: onRename,
          canEdit: canEdit,
        ),
      ),
      header: TripInfoBar(trip: trip),
      compactContent: TripCompactContent(trip: trip),
      expandedContent: TripViewerContent(trip: trip),
    );
  }
}
