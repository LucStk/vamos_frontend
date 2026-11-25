import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/overview/trip_overview_viewer.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/trip_stats_view.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog.dart';

/// Les onglets de la fiche d'un voyage, pour [InfoDialog].
///
/// [editable] : le propriétaire peut modifier le contenu et relancer le
/// calcul des informations de parcours.
List<InfoDialogPage> tripInfoPages(Trip trip, {bool editable = false}) => [
  InfoDialogPage(
    label: 'Aperçu',
    icon: Icons.photo_library_outlined,
    selectedIcon: Icons.photo_library,
    child: TripOverviewViewer(trip: trip, editable: editable),
  ),
  InfoDialogPage(
    label: 'Statistiques',
    icon: Icons.bar_chart_outlined,
    selectedIcon: Icons.bar_chart,
    child: TripStatsView(trip: trip, editable: editable),
  ),
];
