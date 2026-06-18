import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

class TopologyContent extends StatelessWidget {
  final Id<Trip> tripId;

  const TopologyContent({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SegmentLayer(tripId: tripId),
        SegmentMarkersLayer(tripId: tripId),
        VertexLayer(tripId: tripId),
      ],
    );
  }
}
