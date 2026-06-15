import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/trips/application/selectors/trips_selectors.dart';
import 'package:vamos_cartographie/features/trips/presentation/dialogs/trip_viewer_dialog.dart';
import 'package:vamos_cartographie/features/trips/presentation/widgets/trip_card/trip_card_content.dart';
import 'package:vamos_cartographie/features/trips/presentation/widgets/trip_card/trip_card_icon.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
// ── Card ─────────────────────────────────────────────────────────────────────

class TripCard extends ConsumerWidget {
  final Id<Trip> tripId;

  const TripCard({super.key, required this.tripId});

  void _openTrip(BuildContext context) {
    TripViewerDialog.show(
      context: context,
      tripId: tripId,
      onExplore: () => _explore(context),
    );
  }

  void _explore(BuildContext context) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => MapScreen(tripId: tripId)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripByIdProvider(tripId));
    if (trip == null) {
      throw Exception("TripCard -> tripId not found in tripByIdProvider");
    }
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _openTrip(context),
        onDoubleTap: () => _explore(context),
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
