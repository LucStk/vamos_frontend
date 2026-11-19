import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/entities/common/overview/entity_overview_compact.dart';

/// La route n'a pas de titre propre : on affiche un libellé fixe.
class RouteOverviewCompact extends StatelessWidget {
  const RouteOverviewCompact({
    super.key,
    required this.route,
    this.editable = false,
  });

  final RouteFields route;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return EntityOverviewCompact(
      title: 'Itinéraire',
      // ATTENTION : route.id est un TripId. Si les photos de la route sont
      // rattachées à cet id, elles se mélangent à celles du trip.
      // TODO: un RouteId distinct, ou un owner composite (trip + "route").
      ownerId: route.id,
      canEdit: editable,
      leading: Icon(Icons.route, color: scheme.primary),
    );
  }
}
