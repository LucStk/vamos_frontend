import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/application/providers/pop_up_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up_abstract.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class MarkerPopUpShell extends ConsumerWidget {
  final bool isDragging;
  final LatLng latLng;
  final Id<Trip> tripId;
  final AbstractPopUp popUp;
  final Widget child;
  const MarkerPopUpShell({
    super.key,
    required this.tripId,
    required this.latLng,
    required this.popUp,
    required this.child,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!isDragging) {
          ref
              .read(mapPopupProvider(tripId).notifier)
              .show(latLng: latLng, popUp: popUp);
        }
      },
      child: child,
    );
  }
}
