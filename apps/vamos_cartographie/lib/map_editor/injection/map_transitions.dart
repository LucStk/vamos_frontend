import 'package:map_engine/map_camera_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/injection/map_camera_provider.dart';
import 'package:vamos_cartographie/map_editor/map_editor.dart';
import 'package:vamos_cartographie/map_editor/transitions/map_editor_state_transitions.dart';

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
