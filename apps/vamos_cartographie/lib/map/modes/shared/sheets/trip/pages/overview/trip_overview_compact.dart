import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/overview/entity_overview_compact.dart';

class TripOverviewCompact extends ConsumerWidget {
  const TripOverviewCompact({super.key, required this.trip, this.editable = false});

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EntityOverviewCompact(
      title: trip.title,
      ownerId: trip.id,
      canEdit: editable,
      onRename: (newTitle) async {
        ref
            .read(tripStoreProvider.notifier)
            .updateTrip(trip.copyWith(title: newTitle));
        return null;
      },
    );
  }
}
