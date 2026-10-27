import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/ui/features/trip/card/trip_card_content.dart';
import 'package:vamos_cartographie/map/ui/features/trip/card/trip_card_icon.dart';

// ── Card ─────────────────────────────────────────────────────────────────────
@Dependencies([
  // mapScene,
  // MapEditor,
  // // tripEditorScene,
])
class TripCardView extends StatelessWidget {
  final TripSummary tripSummary;

  const TripCardView({super.key, required this.tripSummary});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          // TripRoute(tripId: tripId.value).push(context);
        },

        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 4, 14),
          child: Row(
            children: [
              TripCardIcon(),
              const SizedBox(width: 14),
              TripCardContent(tripSummary: tripSummary),
            ],
          ),
        ),
      ),
    );
  }
}
