// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_view.dart';

class TripCompactContent extends ConsumerWidget {
  final Trip trip;
  const TripCompactContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ce widget agit ici comme un parfait "overflow: hidden" CSS
    // Il coupe le visuel excédentaire sans jamais permettre de scroller
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        key: const ValueKey('compact_content'),
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [ImageCarouselView(id: trip.id)]),
            ],
          ),
        ],
      ),
    );
  }
}
