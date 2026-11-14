import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

/// Page dépliée "Aperçu". TODO: y déplacer le contenu de ton
/// trip_viewer_content.dart actuel (description + galerie complète).
class TripOverviewViewer extends StatelessWidget {
  const TripOverviewViewer({super.key, required this.trip, this.editable = false});

  final Trip trip;
  final bool editable;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
