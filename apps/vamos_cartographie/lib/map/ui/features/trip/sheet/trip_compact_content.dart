// Emplacement : lib/features/waypoint/widgets/waypoint_viewer_content.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/carousel_view.dart';

@Dependencies([])
class TripCompactContent extends ConsumerWidget {
  final Trip trip;
  const TripCompactContent({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Coupe l'excédent visuel sans jamais permettre de scroller.
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          ImageCarouselView(id: trip.id),
          const Spacer(),
        ],
      ),
    );
  }
}
