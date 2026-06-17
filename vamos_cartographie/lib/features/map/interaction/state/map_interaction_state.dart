import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/interaction/state/interaction_mode.dart';
import 'package:vamos_cartographie/features/map/interaction/state/map_cursor.dart';
import 'package:vamos_cartographie/features/map/interaction/state/pop_up.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
part "map_interaction_state.freezed.dart";

@freezed
abstract class MapInteractionState with _$MapInteractionState {
  const factory MapInteractionState({
    InteractionMode? mode,
    MapCursorState? cursor,
    MapPopupState? popup,

    Id<Vertex>? activeVertex,
    Id<Segment>? activeSegment,
    Id<Waypoint>? activeWaypoint,
    LayerHitResult<Id<Segment>>? segmentHit,
  }) = _MapInteractionState;

  factory MapInteractionState.initial() => const MapInteractionState();
}
