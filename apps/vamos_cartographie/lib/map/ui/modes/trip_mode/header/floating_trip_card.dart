import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/ui/chrome/profile_capsule.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_card_bottom_sheet.dart';

class FloatingTripCard extends StatelessWidget {
  const FloatingTripCard({
    super.key,
    required this.canEdit,
    required this.onRename,
    required this.trip,
  });
  final bool canEdit;
  final Future<Failure?> Function(String title)? onRename;
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 6,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: kFloatingCardHeight,
            child: TripHeader(
              canEdit: canEdit,
              onRename: onRename,
              title: trip.title,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: ProfileCapsule(userId: trip.ownerId),
        ),
      ],
    );
  }
}
