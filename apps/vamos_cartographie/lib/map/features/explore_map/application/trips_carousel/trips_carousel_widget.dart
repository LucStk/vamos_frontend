import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapExplore])
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
          return Stack(
            children: [
              Positioned(
                left: 16,
                top: 16,
                bottom: 16,
                child: DesktopTripsCarousel(tripIds: tripIds),
              ),
            ],
          );
        }

        return MobileTripsCarousel(tripIds: tripIds);
      },
    );
  }
}
