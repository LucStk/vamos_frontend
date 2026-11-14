import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/stats/stat_item.dart';

/// Les 3 premières sont affichées dans la page compacte.
List<StatItem> tripStatsOf(Trip trip) {
  // TODO: brancher sur les vrais champs / stores.
  return const [
    StatItem(icon: Icons.straighten, label: 'Distance', value: '—'),
    StatItem(icon: Icons.directions_walk, label: 'Mobilité préférée', value: '—'),
    StatItem(icon: Icons.visibility_outlined, label: 'Vues', value: '—'),
  ];
}
