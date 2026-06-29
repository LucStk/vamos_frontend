import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';
import 'package:vamos_cartographie/features/map_ui/presentation/buttons/button_abstract.dart';

import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

class EndSegmentButton extends AbstractMapButton {
  final Id<Vertex> vertexId;
  const EndSegmentButton({
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
      icon: const Icon(Icons.stop_circle, size: 30),
    );
  }
}
