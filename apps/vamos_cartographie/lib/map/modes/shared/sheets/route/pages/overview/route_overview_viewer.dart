import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

/// Page dépliée "Aperçu". TODO: y déplacer le contenu de ton
/// route_viewer_content.dart actuel (description + galerie complète).
class RouteOverviewViewer extends StatelessWidget {
  const RouteOverviewViewer({super.key, required this.route, this.editable = false});

  final RouteFields route;
  final bool editable;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
