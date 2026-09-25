import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/map/features/explore_map/explore_map.dart';
import '/domain_features/domain_features.dart';

// ── Card ─────────────────────────────────────────────────────────────────────
class TripCardView extends ConsumerWidget {
  final Id<Trip> tripId;

  const TripCardView({super.key, required this.tripId});

  void _openTrip(BuildContext context) {
    TripViewerDialog.show(
      context: context,
      tripId: tripId,
      onExplore: () => {},
    );
  }

  // void _explore(BuildContext context) async {
  //   await Navigator.of(
  //     context,
  //   ).push(MaterialPageRoute(builder: (_) => TripMapScreen(tripId: tripId)));
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    if (trip == null) {
      throw Exception("TripCard -> tripId not found in tripByIdProvider");
    }
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _openTrip(context),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 4, 14),
          child: Row(
            children: [
              TripCardIcon(),
              const SizedBox(width: 14),
              TripCardContent(trip: trip),
            ],
          ),
        ),
      ),
    );
  }
}
