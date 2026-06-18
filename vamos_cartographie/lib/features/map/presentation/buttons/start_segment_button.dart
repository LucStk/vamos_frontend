import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/infrastructure/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/presentation/buttons/button_abstract.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

class StartSegmentButton extends AbstractMapButton {
  final Id<Vertex> vertexId;
  const StartSegmentButton({
    super.key,
    required super.tripId,
    required this.vertexId,
  });

  @override
  Widget buildWithCtrl(BuildContext context, WidgetRef ref, MapCtrl mapCtrl) {
    return IconButton(
      onPressed:
          () {}, //TODO => mapCtrl.dispatch(OpenEditWaypointDialog(waypointId)),
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.start_outlined, size: 30),
    );
  }
}
