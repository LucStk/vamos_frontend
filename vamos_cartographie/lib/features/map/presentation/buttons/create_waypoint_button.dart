import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/application/commands/commands.dart';
import 'package:vamos_cartographie/features/map/infrastructure/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/waypoint.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
import "button_abstract.dart";

class CreateWaypointButton extends AbstractMapButton {
  final Id<Waypoint> waypointId;
  const CreateWaypointButton({
    super.key,
    required super.tripId,
    required this.waypointId,
  });

  @override
  Widget buildWithCtrl(BuildContext context, WidgetRef ref, MapCtrl mapCtrl) {
    return IconButton(
      onPressed: () => mapCtrl.dispatch(OpenEditWaypointDialog(waypointId)),
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.add_location, size: 30),
    );
  }
}
