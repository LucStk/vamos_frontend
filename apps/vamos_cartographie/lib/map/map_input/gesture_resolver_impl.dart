import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/id.dart';
import 'package:map_application/domain/map_editor_state.dart';
import 'package:map_application/effects/map_effects.dart';
import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_camera_controller_provider.dart';
import 'package:vamos_cartographie/map/injection/map_editor_state.dart';
import 'package:vamos_cartographie/map/injection/map_effects.dart';

class GesturesResolverImpl extends GesturesResolver {
  final WidgetRef _ref;
  final Id<Trip> _tripId;

  const GesturesResolverImpl({required WidgetRef ref, required Id<Trip> tripId})
    : _ref = ref,
      _tripId = tripId;

  @override
  MapEffects get mapEffects => _ref.read(mapEffectsProvider(_tripId).notifier);

  @override
  MapCameraController get camera => _ref.read(mapCameraControllerProvider);

  @override
  MapEditorState get editorState => _ref.read(mapEditorStateProvider(_tripId));

  @override
  set editorState(MapEditorState value) {
    _ref.read(mapEditorStateProvider(_tripId).notifier).emit(value);
  }
}
