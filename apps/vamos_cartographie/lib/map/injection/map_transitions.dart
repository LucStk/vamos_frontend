import 'package:map_application/domain/map_editor_state.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:map_application/transitions/map_editor_state_transitions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map/map.dart';

// Généré automatiquement par riverpod_generator
part 'map_transitions.g.dart';

@Riverpod(keepAlive: true)
class MapEditorStateTransitionsNotifier
    extends _$MapEditorStateTransitionsNotifier
    implements MapEditorStateTransitions {
  @override
  void build(TripId tripId) {
    _tripId = tripId;
  }

  late final TripId _tripId;

  @override
  MapCameraController? get cameraController =>
      ref.read(mapCameraControllerOrNullProvider);

  @override
  MapEditorState get mapState => ref.read(mapEditorStateProvider(_tripId));

  @override
  set mapState(MapEditorState value) {
    ref.read(mapEditorStateProvider(_tripId).notifier).state = value;
  }
}
