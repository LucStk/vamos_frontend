import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

/// Page dépliée "Aperçu". TODO: y déplacer le contenu de ton
/// waypoint_viewer_content.dart actuel (description + galerie complète).
class WaypointOverviewViewer extends StatelessWidget {
  const WaypointOverviewViewer({super.key, required this.waypoint, this.editable = false});

  final WaypointFields waypoint;
  final bool editable;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
