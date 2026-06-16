import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/map/application/providers/map_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/menus/menus.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class MarkerWtPopmenuShell extends ConsumerWidget {
  final bool isDragging;
  final LatLng latLng;
  final Id<Trip> tripId;
  final PopMenu popMenu;
  final Widget child;
  const MarkerWtPopmenuShell({
    super.key,
    required this.tripId,
    required this.latLng,
    required this.popMenu,
    required this.child,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!isDragging) {
          ref
              .read(mapStateProvider(tripId).notifier)
              .showPopUp(latLng: latLng, popMenu: popMenu);
        }
      },
      child: child,
    );
  }
}
