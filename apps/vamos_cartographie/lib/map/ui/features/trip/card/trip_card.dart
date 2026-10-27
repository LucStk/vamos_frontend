import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/ui/features/trip/card/trip_card_content.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key, required this.tripSummary, required this.onTap});

  final TripSummary tripSummary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      color: Theme.of(context).colorScheme.surfaceContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TripCardContent(tripSummary: tripSummary),
        ),
      ),
    );
  }
}
