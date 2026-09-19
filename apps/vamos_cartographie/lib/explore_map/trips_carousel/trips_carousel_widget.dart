import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/explore_map/trips_carousel/desktop_trips_carousel.dart';
import 'package:vamos_cartographie/explore_map/trips_carousel/mobile_trips_carousel.dart';
import 'package:vamos_cartographie/trip/trip.dart';

class TripsCarouselWidget extends ConsumerWidget {
  const TripsCarouselWidget({super.key});

  static const _desktopBreakpoint = 700.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripStore = ref.watch(tripStoreProvider).tripStore;
    final tripIds = tripStore.getIds();

    if (tripIds.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _desktopBreakpoint) {
          return DesktopTripsCarousel(tripIds: tripIds);
        }

        return MobileTripsCarousel(tripIds: tripIds);
      },
    );
  }
}
