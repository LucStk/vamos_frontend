// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/explore/ui/explore_ui.dart';
import 'package:vamos_cartographie/map/modes/place_origin/ui/place_origin_ui.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/select_route_ui.dart';
import 'package:vamos_cartographie/map/modes/route_edit/edit_span/edit_span_ui.dart';
import 'package:vamos_cartographie/map/modes/route_edit/ui/route_edit_ui.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/trip_edit_mode_ui.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/waypoints_edit.dart';

@Dependencies([ModeMachine])
class ModeUi extends ConsumerWidget {
  const ModeUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(mapModeProvider);

    return switch (mode) {
      ExploreMode t => ExploreUi(t),
      CreateWaypointMode t => CreateWaypointUi(t),
      WaypointsEditMode t => WaypointsEditUi(t),
      SelectRouteMode t => SelectRouteUi(t),
      EditSpanMode t => EditSpanUi(t),
      RouteEditMode t => RouteEditUi(t),
      TripEditMode t => TripEditModeUi(t),
      PlaceOriginMode t => PlaceOriginUi(t),
      _ => SizedBox.shrink(),
    };
  }
}
