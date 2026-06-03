import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/waypoints/waypoints.dart';
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';

class GhostMarkerView extends ConsumerWidget {
  final GWaypointEnum type;

  const GhostMarkerView({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: type.color.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(color: type.color.withOpacity(0.6), width: 1),
      ),
    );
  }
}
